
type Conn_Info: record {
    bytes: count;
};

type connection: record {
    conn: Conn_Info;
};

local ci = Conn_Info($bytes=0);
local c = connection($conn=ci);
local x = 0;
while ( ++x < 10000000 ) {
    c$conn$bytes = c$conn$bytes + 1;
}
