global hlls: table[count] of opaque of cardinality;
local x = 0;
while ( ++x < 100000 ) {
    hlls[x] = hll_cardinality_init(0.1, 0.99);
    hll_cardinality_add(hlls[x], 1.2.3.1);
    hll_cardinality_add(hlls[x], 1.2.3.2);
}
