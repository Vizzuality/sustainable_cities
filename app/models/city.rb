# frozen_string_literal: true
# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string
#  country_id  :integer
#  iso         :string
#  lat         :decimal(, )
#  lng         :decimal(, )
#  province    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_featured :boolean          default(FALSE)
#

class City < ApplicationRecord
  belongs_to :country, inverse_of: :cities, touch: true

  has_many :users, inverse_of: :city
  has_many :project_cities
  has_many :projects, through: :project_cities
  has_many :photos, as: :attacheable, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  after_save { projects.find_each(&:touch) }

  validates :name, presence: true

  scope :by_name_asc, -> { order('cities.name ASC') }

  scope :filter_by_name,    ->(search_term) { where('cities.name ilike ?', "%#{search_term}%") }
  scope :filter_by_country, ->(country_id)  { where(country_id: country_id)                    }

  class << self
    def fetch_all(options)
      search_term = options['search']  if options.present? && options['search'].present?
      country_id  = options['country'] if options.present? && options['country'].present?

      cities = includes(:country)
      cities = cities.filter_by_name(search_term)   if search_term.present?
      cities = cities.filter_by_country(country_id) if country_id.present?
      cities
    end
  end

  def bmes_quantity
    return_hash = {}
    city_bmes = Bme.joins(projects: :cities).where("city_id = #{id}")
    categories = Category.includes({children: [{children: [:bmes]}]})
                  .where(slug: ["funding-source", "investment-component", "delivery-mechanism", "financial-product"])

    categories.each do |category|
      return_hash[category.name] = first_children(category, city_bmes)
    end

    return_hash
  end

  def first_children(category_level_1, bmes)
    return_hash = {}

    return_hash[:quantity] = category_level_1.children.map do |category_level_2|
      category_level_2.children.map { |category_level_3| (category_level_3.bmes & bmes).size }
    end.flatten.reduce(:+)

    category_level_1.children.each do |category_level_2|
      return_hash[category_level_2.name] = {
        quantity: category_level_2.children.map { |category| (category.bmes & bmes).size }.reduce(:+),
        children: second_children(category_level_2, bmes)
      }
    end

    return_hash
  end

  def second_children(category_level_2, bmes)
    return_hash = {}

    category_level_2.children.each do |category_level_3|
      return_hash[category_level_3.name] = (category_level_3.bmes & bmes).count
    end

    return_hash
  end
end
