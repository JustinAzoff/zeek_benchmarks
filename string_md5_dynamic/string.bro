function ha()
{
    local s = "";
    s += "my string";
    {% for p in range(number) %}
    s += "more";
    {% endfor %}
    s += "even more";
    md5_hash(s);
}

local x = 0;
while ( ++x < {{ N }} ) {
    ha();
}
