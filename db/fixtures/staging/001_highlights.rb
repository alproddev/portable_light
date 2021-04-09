highlight = Highlight.seed do |s|
  s.id = 1
  s.title = 'Highlighted Article 1'
  s.body = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  s.related_links = '* [Link 1](http://google.com)
* [Link 2](http://google.com)
* [Link 3](http://google.com)'
  s.download = file_attachment('download.pdf')
  s.is_visible = true
end

HighlightImage.seed do |s|
  s.id = 1
  s.highlight = highlight
  s.file = file_attachment('image-1.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

HighlightImage.seed do |s|
  s.id = 2
  s.highlight = highlight
  s.file = file_attachment('image-2.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

HighlightImage.seed do |s|
  s.id = 3
  s.highlight = highlight
  s.file = file_attachment('image-3.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

highlight = Highlight.seed do |s|
  s.id = 2
  s.title = 'Highlighted Article 2'
  s.body = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  s.related_links = '* [Link 1](http://google.com)
* [Link 2](http://google.com)
* [Link 3](http://google.com)'
  s.download = file_attachment('download.pdf')
  s.is_visible = true
end

HighlightImage.seed do |s|
  s.id = 4
  s.highlight = highlight
  s.file = file_attachment('image-1.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

HighlightImage.seed do |s|
  s.id = 5
  s.highlight = highlight
  s.file = file_attachment('image-2.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

HighlightImage.seed do |s|
  s.id = 6
  s.highlight = highlight
  s.file = file_attachment('image-3.jpg')
  s.caption = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
end

