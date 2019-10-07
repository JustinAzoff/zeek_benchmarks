type Info: record {
    a: count;
    b: count;
    c: count;
};

function foo()
{
}

event zeek_init() {
    local x = 0;
    while ( ++x < {{ N }} ) {
        foo();
    }
}
