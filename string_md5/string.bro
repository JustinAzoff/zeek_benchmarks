function ha()
{
    local s = "";
    s += "my string";
    s += "more";
    s += "more";
    s += "even more";
    md5_hash(s);
}

local x = 0;
while ( ++x < {{ N }} ) {
    ha();
}
