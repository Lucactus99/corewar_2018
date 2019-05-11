.name "rainbow dash"
.comment "friendship is witchcraft"

loop:
    st r1, 6
    live %0
    ld %0, r2
    zjmp %:loop
