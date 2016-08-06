function one(x: count): bool
{
    return T;
}

function two(x: count): bool
{
    return one(x);
}

function three(x:count): bool
{
    return two(x);
}

local x = 0;
while ( x < 2000000 ) {
    if(three(x))
        ++x;
}
