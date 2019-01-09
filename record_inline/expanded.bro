type Info: record {
    a: count;
    b: count;
    c: count;
};
function foo()
{
    local tmp: Info;
    tmp$a=1;
    tmp$b=2;
    tmp$c=3;
}

event bro_init() {
    local x = 0;
    while ( ++x < {{ N }} ) {
        foo();
    }
}
