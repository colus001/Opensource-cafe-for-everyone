@Util =
  slugify: (text) -> unidecode(text).replace(' ', '-') if text
