function Image(paragraph)
    local to_string = pandoc.utils.stringify
    if paragraph.classes:find('fun_fact',1) then
        local file = io.open("kallipos-contribution/" .. paragraph.src, 'r')
        local doc = pandoc.read(file:read('*a')).meta
        file:close()
        local caption = to_string(doc.caption)
        local name = to_string(doc.name)
        local am = to_string(doc.id)
        local url = to_string(doc.link)
        local link_name = to_string(doc.linkname)
        local student_info = "Ονοματεπώνυμο φοιτητή: " .. name .. "  \n> Αριθμός μητρώου: " .. am .. ""
        local link ='[' .. link_name .. '](' .. url .. ')'
        local line = "************************************************************"
        local md = '> **Fun Fact:**  \n_' .. caption .. '_  \n> ' .. line .. '  \n '.. student_info .. '  \n ' .. "link: **" .. link .."**" .. "  \n> " .. line
        return pandoc.RawInline('markdown',md)
    end
end
