local PlotScripts = {}; PlotScripts.__index = PlotScripts

function PlotScripts:new()
    return setmetatable({
        plots = {
            {
                {"Ele acorda sem sua mulher ao lado, vai até a cozinha...", "Põe dois pratos na mesa, mas não sente sua presença","De qualquer forma ele tem que trabalhar..."},
                {"Chegando ao seu trabalho lhe é dada uma missão urgente.", "Uma nova missão! Estamos sendo invadidos por OVNIs! Abata o máximo de unidades possível."},
                {"Acho que já é o suficiente, preciso voltar para casa e ver se ela está segura."},
                {"Ela realmente não está aqui!", "Isso é tudo culpa daqueles malditos OVNIs!"},
                {"Preciso descobri tudo o que posso sobre eles, para manter a pessoas seguras..."},
                {"Os ataques continuam! Precisamos de reforços!"},
                {""}
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
