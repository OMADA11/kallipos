function Image(img)
    if img.classes:find('alxicontrib',1) then
      local f = io.open("kallipos-contribution/" .. img.src, 'r')
      local doc = pandoc.read(f:read('*a'))
      f:close()
      local comment = pandoc.utils.stringify(doc.meta.comment) or "Comment has not been set"
      local student = pandoc.utils.stringify(doc.meta.student) or "Student has not been set"
      local id = pandoc.utils.stringify(doc.meta.id) or "Student ID has not been set"
      local credentials = " Student: " .. student .. " (" .. id .. ")"
      local text = "\n\n _" .. comment .. "_ \n\n"
      return pandoc.RawInline('markdown',text .. credentials)
    end
end
