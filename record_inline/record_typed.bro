type Info: record {
    a: count;
    b: count;
    c: count;
};
function foo()
{
    local tmp: Info = Info($a=1,$b=2,$c=3);
}

event bro_init() {
    local x = 0;
    while ( ++x < {{ N }} ) {
        foo();
    }
}