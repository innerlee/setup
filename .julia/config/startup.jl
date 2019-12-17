atreplinit() do repl
    try
        @eval using Pkg
        haskey(Pkg.installed(), "OhMyREPL") || @eval Pkg.add("OhMyREPL")
    catch
    end
    try
        @eval using OhMyREPL
    catch
    end

    try
        @eval using Pkg
        haskey(Pkg.installed(), "Revise") || @eval Pkg.add("Revise")
    catch
    end
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end
