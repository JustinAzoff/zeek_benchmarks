
function a(): bool
{
    return T;
}

function b(): bool
{
    return T;
}

global funcs: vector of function(): bool;

function go()
{
    for (f in funcs)
        funcs[f]();
}

event bro_init()
{
    local x = 0;
    while ( x < 2000000 ) {
        ++x;
        go();
    }
}
