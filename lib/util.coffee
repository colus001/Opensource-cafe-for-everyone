@Util =
  slugify: (text) -> unidecode(text).replace(' ', '-').replace('.', '').toLowerCase() if text
