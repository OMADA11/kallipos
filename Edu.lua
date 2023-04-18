function Image(img)
	 if img.classes:find('Edu',1) then
	   local file = io.open("EDU/" .. img.src, 'r')
	   local doc = pandoc.read(file:read('*a'))
	   file:close()
	   local title = pandoc.utils.stringify(doc.meta.title) or "title has not been set"
	   local caption = pandoc.utils.stringify(doc.meta.caption) or "caption has not been set"
	   local name = pandoc.utils.stringify(doc.meta.name) or "name has not been set"
	   local am = pandoc.utils.stringify(doc.meta.am) or "name has not been set"
	   local inf = pandoc.utils.stringify(doc.meta.inf) or "name has not been set"
	   local myinfo = "**" .. "Ονοματεπώνυμο Φοιτητή: " .."**" .. name .. "   \n " .. "**" .. "Αριθμός Μητρώου: " .. "**" .. am
	   local md = "> _" .. "**" .. title ..":" .."**" .. "_  \n> " .. caption .. "   \n> " .. myinfo  .. "   \n> " .. "**"  .. "Πηγή Eμπνευσης: " ..  "**" .. inf
	   return pandoc.RawInline('markdown',md)
      end
end
