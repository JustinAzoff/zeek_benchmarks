function ha()
{
    local s = string_vec();
    s += "my string";
    s += "more";
    s += "more";
    s += "even more";
    md5_hash(join_string_vec(s, ""));
}

local x = 0;
while ( ++x < {{ N }} ) {
    ha();
}
