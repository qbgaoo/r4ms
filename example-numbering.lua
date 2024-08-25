local counter = 0

function Div(el)
  if el.classes:includes('example') then
    counter = counter + 1
    -- 为 example 类的 Div 添加编号，并用 <strong> 包裹
    table.insert(
      el.content, 1, 
      pandoc.RawInline('html', '<strong>Example ' .. counter .. ':</strong> '))
    return el
  end
end