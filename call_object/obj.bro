
type Conn_Info: record {
    bytes: count;
};

type connection: record {
    conn: Conn_Info;
};

function b(c: connection): bool
{
    return (c$conn$bytes > 10000);
}


local ci = Conn_Info($bytes=0);
local c = connection($conn=ci);
local x = 0;
local y = 0;
while ( ++x < 2000000 ) {
    c$conn$bytes += 1;
    if(b(c))
        ++y;
}
