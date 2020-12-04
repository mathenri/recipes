module RecipesHelper
  def tag_translations(tag_english)
    translations = {
      "fish" => "Fisk",
      "meat" => "Kött",
      "soup" => "Soppa",
      "vegetarian" => "Vegetarisk"
    }
    translations[tag_english]
  end
end
