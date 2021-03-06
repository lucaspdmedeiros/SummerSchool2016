const beesize	= 100
const plantsize = 100

const β  = 5.0

const payoff = [1. -0.5; 0.5 -1]

type Agent
     id::Int32
     neigh::Vector{Int32}
     defect::Bool
end

type Society
     agents::Vector{Agent}
end

########################
# Agent Redefinitions  #
########################

length(ag::Agent) = length(ag.neigh)
size(ag::Agent)   = size(ag.neigh)

getindex(ag::Agent, i) = ag.neigh[i]

start(ag::Agent)   = 1
done(ag::Agent, s) = s > length(ag)
next(ag::Agent, s) = (ag[s], s+1)

##############################
#    Society Redefinitions   #
##############################

length(soc::Society)    = length(soc.agents)
size(soc::Society)      = (length(soc.agents), length(soc.agents[1]))

getindex(soc::Society, i::Int64)                    = soc.agents[i]
getindex(soc::Society, i::Int64, j::Int64)          = soc.agents[i, j]
getindex(soc::Society, i::Int64, r::UnitRange)      = soc.agents[i, r]
getindex(soc::Society, r::UnitRange, j::Int64)      = soc.agents[r, j]
getindex(soc::Society, r::UnitRange, s::UnitRange)  = soc.agents[r, s]
getindex(soc::Society, i::Int64, c::Colon)          = soc.agents[i, c]
getindex(soc::Society, c::Colon, j::Int64)          = soc.agents[c, j]
getindex(soc::Society, c::Colon, r::UnitRange)      = soc.agents[c, r]
getindex(soc::Society, r::UnitRange, c::Colon)      = soc.agents[r, c]

start(soc::Society)   = 1
done(soc::Society, s) = s > length(soc)
next(soc::Society, s) = (soc[s], s+1)