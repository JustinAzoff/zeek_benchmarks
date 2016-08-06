function one(x: count): bool
{
    return T;
}
function four(x: count): bool
{
    return one(x);
    return one(x);
    return one(x);
    return one(x);
}

local x = 0;
while ( x < 2000000 ) {
    if(four(x))
        ++x;
}
