local counter = 0

function Div(el)
  if el.classes:includes('example') then
    counter = counter + 1
    -- Add a number to the Div of the example class and wrap it with <strong>
    table.insert(
      el.content, 1, 
      pandoc.RawInline('html', '<strong>Example ' .. counter .. '</strong> '))
    return el
  end
end