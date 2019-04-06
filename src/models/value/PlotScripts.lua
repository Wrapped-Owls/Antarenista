local PlotScripts = {}; PlotScripts.__index = PlotScripts

function PlotScripts:new()
    return setmetatable({
        plots = {
            {
                {"Um cara acorda e da o cu", "Xupa porra"},
                {"vai para a cama"}
            },
            {
                {"Dinheiro de caligrafia"}
            }
        }
    }, PlotScripts)
end

function PlotScripts:getPlot(level, stage)
    return self.plots[level][stage]
end

return PlotScripts
