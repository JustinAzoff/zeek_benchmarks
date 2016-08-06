function one(x: count): bool
{
    return T;
}

function two(x: count): bool
{
    return one(x);
}

function three(x: count): bool
{
    return two(x);
}
function four(x: count): bool
{
    return three(x);
}

local x = 0;
while ( x < 2000000 ) {
    if(four(x))
        ++x;
}
