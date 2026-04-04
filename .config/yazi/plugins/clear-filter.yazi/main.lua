--- @sync entry
return {
    setup = function()
        ps.sub("cd", function()
            local active = cx.active
            if active.current.files.filter then
                ya.emit("escape", { filter = true })
            end
        end)
    end,
}
