
function a(): bool
{
    return T;
}

function b(): bool
{
    return T;
}

#global funcs: vector of function(): bool;

global funcs: set[function(): bool] = {a,b};

#event bro_init()
#{
#    funcs[|funcs|] = a;
#    funcs[|funcs|] = b;
#}

function go()
{
    for (f in funcs)
        f();
}

event bro_init()
{
    local x = 0;
    while ( x < 2000000 ) {
        ++x;
        go();
    }
}
