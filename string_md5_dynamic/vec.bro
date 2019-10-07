function ha()
{
    local s = string_vec();
    s += "my string";
    {% for p in range(number) %}
    s += "more";
    {% endfor %}
    s += "even more";
    md5_hash(join_string_vec(s, ""));
}

local x = 0;
while ( ++x < {{ N }} ) {
    ha();
}
