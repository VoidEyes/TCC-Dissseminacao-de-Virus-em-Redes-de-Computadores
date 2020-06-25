breed [nuvens nuvem]
breed [usuarios usuario]

links-own[
  link_tag
  usu1
  usu2
  nuvem_tag_link
  visitado?
]

nuvens-own[
  nuvem_tag
  real_id
  nuvem_link
]

usuarios-own[
  nuvem_tag_usu
  usu_tag
  real_id
  infectado?
  removido?
  antidoto?
  suscetivel?
  usu_visitado?
]

globals[
  xy1
  x1
  y1
  xexterno
  yexterno
  xinterno
  yinterno
  link_t
  nuvem_t
]

to go
  ifelse p_antidotal?[
    if all? usuarios [antidoto? = 1]
    [stop]
  ][
    if all? usuarios [suscetivel? = 1]
    [stop]
  ]
  infec2
  removido
  if p_antidotal?[
    antidotal
  ]
  suscetivel
  tick
end

to setup
  clear-all
  set xexterno [30 10 20 10 20 10 30 40 50 50 40 50]
  set yexterno [10 10 20 30 40 50 50 40 50 30 20 10]
  set xy1 [-3 -2 -1 0 1 2 3]
  set xinterno [-2 -2 2 2 -3 3 0 0 0 3]
  set yinterno [-2 2 2 -2 0 0 3 -3 0 3]
  let criando qtd_nuvens
  Criar-Nuvi
  ask nuvens [
    set shape "circle 3"
    set size 7
    set color 107
  ]
  ask usuarios[
    set shape "circle"
    set size 1
    set color 9.9
    set infectado? 0
    set removido? 0
    set antidoto? 0
    set usu_visitado? 0
    set suscetivel? 1
  ]
  Infectados-Comeco
  if p_antidotal?[
    Antidotal-Comeco
  ]
  Criar-Liga
  Usu-Liga
  reset-ticks
end

to Criar-Nuvi
  let iteem 0
  set nuvem_t 1
  let usu_t 1
  let real 0
  repeat qtd_nuvens[
    set x1 item iteem xexterno
    set y1 item iteem yexterno
    create-nuvens 1[setxy x1 y1 set nuvem_tag nuvem_t set real_id real]
    set iteem iteem + 1
    set nuvem_t nuvem_t + 1
    set real real + 1
  ]
  set iteem 0
  let item2 0
  set nuvem_t 1
  repeat qtd_nuvens[
    set usu_t 1
    repeat qtd_usu[
      set x1 item iteem xexterno + item item2 xinterno
      set y1 item iteem yexterno + item item2 yinterno
      create-usuarios 1 [setxy x1 y1 set nuvem_tag_usu nuvem_t set usu_tag usu_t set real_id real]
      set usu_t usu_t + 1
      set real real + 1
      set item2 item2 + 1
    ]
    set iteem iteem + 1
    set nuvem_t nuvem_t + 1
    set item2 0
  ]
end

to Criar-Liga
ifelse qtd_nuvens = 12[
    Criar-Liga11
  ][
    ifelse qtd_nuvens = 11[
      Criar-Liga10
    ][
      ifelse qtd_nuvens = 10[
        Criar-Liga9
      ][
        ifelse qtd_nuvens = 9[
          Criar-Liga8
        ][
          ifelse qtd_nuvens = 8[
            Criar-Liga7
          ][
          ifelse qtd_nuvens = 7[
              Criar-Liga6
          ][
              ifelse qtd_nuvens = 6[
                Criar-Liga5
              ][
                ifelse qtd_nuvens = 5[
                  Criar-Liga4
                ][ifelse qtd_nuvens = 4[
                    Criar-Liga3
                  ][
                    ifelse qtd_nuvens = 3[
                      Criar-Liga2
                    ][
                      ifelse qtd_nuvens = 2[
                        Criar-Liga1
                      ][
                        if qtd_nuvens = 1[
                          Criar-Liga0
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]
  ]
end

to Criar-Liga0
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask nuvens with[nuvem_tag = 1][set nuvem_link [1]]
end

to Criar-Liga1
  ask turtle 0[set nuvem_link [1 2]]
  ask turtle 1[set nuvem_link [1 2]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    ]
end

to Criar-Liga2
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3]]
  ask turtle 1[set nuvem_link [1 2 3]]
  ask turtle 2[set nuvem_link [1 2 3]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2]
  ask turtle 1[
    create-link-with turtle 2]
end

to Criar-Liga3
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4]]
  ask turtle 3[set nuvem_link [2 3 4]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3]
end

to Criar-Liga4
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4 5]]
  ask turtle 3[set nuvem_link [2 3 4 5]]
  ask turtle 4[set nuvem_link [3 4 5]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3
    create-link-with turtle 4]
  ask turtle 3[
    create-link-with turtle 4]
end

to Criar-Liga5
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4 5]]
  ask turtle 3[set nuvem_link [2 3 4 5 6]]
  ask turtle 4[set nuvem_link [3 4 5 6]]
  ask turtle 5[set nuvem_link [4 5 6]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3
    create-link-with turtle 4]
  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]
  ask turtle 4[
    create-link-with turtle 5]
end

to Criar-Liga6
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3 7]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4]]
  ask turtle 3[set nuvem_link [2 3 4 5 6]]
  ask turtle 4[set nuvem_link [4 5 6 7]]
  ask turtle 5[set nuvem_link [4 5 6 7]]
  ask turtle 6[set nuvem_link [1 5 6 7]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
   ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 6]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3]
  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]
  ask turtle 4[
    create-link-with turtle 5
    create-link-with turtle 6]
  ask turtle 5[
    create-link-with turtle 6]
end

to Criar-Liga7
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3 8]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4]]
  ask turtle 3[set nuvem_link [2 3 4 5 6]]
  ask turtle 4[set nuvem_link [4 5 6 7]]
  ask turtle 5[set nuvem_link [4 5 6 7]]
  ask turtle 6[set nuvem_link [5 6 7 8]]
  ask turtle 7[set nuvem_link [1 7 8]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
  ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 7]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3]
  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]
  ask turtle 4[
    create-link-with turtle 5
    create-link-with turtle 6]
  ask turtle 5[
    create-link-with turtle 6]
  ask turtle 6[
    create-link-with turtle 7]
end

to Criar-Liga8
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3 8]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4]]
  ask turtle 3[set nuvem_link [2 3 4 5 6]]
  ask turtle 4[set nuvem_link [4 5 6 7]]
  ask turtle 5[set nuvem_link [4 5 6 7]]
  ask turtle 6[set nuvem_link [5 6 7 8]]
  ask turtle 7[set nuvem_link [1 7 8 9]]
  ask turtle 8[set nuvem_link [7 8 9]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
  ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 7]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3]
  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]
  ask turtle 4[
    create-link-with turtle 5
    create-link-with turtle 6]
  ask turtle 5[
    create-link-with turtle 6]
  ask turtle 6[
    create-link-with turtle 7
    create-link-with turtle 8]
  ask turtle 7[
    create-link-with turtle 8]
end

to Criar-Liga9
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask turtle 0[set nuvem_link [1 2 3 10]]
  ask turtle 1[set nuvem_link [1 2 3 4]]
  ask turtle 2[set nuvem_link [1 2 3 4]]
  ask turtle 3[set nuvem_link [2 3 4 5 6]]
  ask turtle 4[set nuvem_link [4 5 6 7]]
  ask turtle 5[set nuvem_link [4 5 6 7]]
  ask turtle 6[set nuvem_link [5 6 7 8]]
  ask turtle 7[set nuvem_link [7 8 9 10]]
  ask turtle 8[set nuvem_link [7 8 9 10]]
  ask turtle 9[set nuvem_link [1 8 9 10]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
  ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 9]
  ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]
  ask turtle 2[
    create-link-with turtle 3]
  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]
  ask turtle 4[
    create-link-with turtle 5
    create-link-with turtle 6]
  ask turtle 5[
    create-link-with turtle 6]
  ask turtle 6[
    create-link-with turtle 7
    create-link-with turtle 8]
  ask turtle 7[
    create-link-with turtle 8
    create-link-with turtle 9]
  ask turtle 8[
    create-link-with turtle 9]
end

to Criar-Liga10
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask nuvens with[nuvem_tag = 1][set nuvem_link [1 2 3 11]]
  ask nuvens with[nuvem_tag = 2][set nuvem_link [1 2 3 4]]
  ask nuvens with[nuvem_tag = 3][set nuvem_link [1 2 3 4]]
  ask nuvens with[nuvem_tag = 4][set nuvem_link [2 3 4 5 6]]
  ask nuvens with[nuvem_tag = 5][set nuvem_link [4 5 6 7]]
  ask nuvens with[nuvem_tag = 6][set nuvem_link [4 5 6 7]]
  ask nuvens with[nuvem_tag = 7][set nuvem_link [5 6 7 8 9]]
  ask nuvens with[nuvem_tag = 8][set nuvem_link [7 8 9 10]]
  ask nuvens with[nuvem_tag = 9][set nuvem_link [7 8 9 10]]
  ask nuvens with[nuvem_tag = 10][set nuvem_link [8 9 10 11]]
  ask nuvens with[nuvem_tag = 11][set nuvem_link [1 10 11]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
  ask turtle 0[
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 10]

   ask turtle 1[
    create-link-with turtle 2
    create-link-with turtle 3]

  ask turtle 2[
    create-link-with turtle 3]

  ask turtle 3[
    create-link-with turtle 4
    create-link-with turtle 5]

  ask turtle 4[
    create-link-with turtle 5
    create-link-with turtle 6]

  ask turtle 5[
    create-link-with turtle 6]

  ask turtle 6[
    create-link-with turtle 7
    create-link-with turtle 8]

  ask turtle 7[
    create-link-with turtle 8
    create-link-with turtle 9]

  ask turtle 8[
    create-link-with turtle 9]

  ask turtle 9[
    create-link-with turtle 10
   ]

end

to Criar-Liga11 ;;Fixo
  ;; Seleciona uma nuvem com valor de tag requisitado e define um conjunto de valores que indicam as tags de nuvens que existem links
  ask nuvens with[nuvem_tag = 1][set nuvem_link [1 2 3 11 12]]
  ask nuvens with[nuvem_tag = 2][set nuvem_link [1 2 3 4]]
  ask nuvens with[nuvem_tag = 3][set nuvem_link [1 2 3 4]]
  ask nuvens with[nuvem_tag = 4][set nuvem_link [2 3 4 5 6]]
  ask nuvens with[nuvem_tag = 5][set nuvem_link [4 5 6 7]]
  ask nuvens with[nuvem_tag = 6][set nuvem_link [4 5 6 7]]
  ask nuvens with[nuvem_tag = 7][set nuvem_link [5 6 7 8 9]]
  ask nuvens with[nuvem_tag = 8][set nuvem_link [7 8 9 10]]
  ask nuvens with[nuvem_tag = 9][set nuvem_link [7 8 9 10]]
  ask nuvens with[nuvem_tag = 10][set nuvem_link [8 9 10 11 12]]
  ask nuvens with[nuvem_tag = 11][set nuvem_link [1 10 11 12]]
  ask nuvens with[nuvem_tag = 12][set nuvem_link [1 10 11 12]]

  ;;Seleciona uma nuvem com o valor de tag requisitado e cria o link com as nuvens necessárias a partir do id da outra nuvem
  ask nuvens with[nuvem_tag = 1][
    create-link-with turtle 1
    create-link-with turtle 2
    create-link-with turtle 10
    create-link-with turtle 11]

  ask nuvens with[nuvem_tag = 2][
    create-link-with turtle 2
    create-link-with turtle 3]

  ask nuvens with[nuvem_tag = 3][
    create-link-with turtle 3]

  ask nuvens with[nuvem_tag = 4][
    create-link-with turtle 4
    create-link-with turtle 5]

  ask nuvens with[nuvem_tag = 5][
    create-link-with turtle 5
    create-link-with turtle 6]

  ask nuvens with[nuvem_tag = 6][
    create-link-with turtle 6]

  ask nuvens with[nuvem_tag = 7][
    create-link-with turtle 7
    create-link-with turtle 8]

  ask nuvens with[nuvem_tag = 8][
    create-link-with turtle 8
    create-link-with turtle 9]

  ask nuvens with[nuvem_tag = 9][
    create-link-with turtle 9]

  ask nuvens with[nuvem_tag = 10][
    create-link-with turtle 10
   create-link-with turtle 11]

  ask nuvens with[nuvem_tag = 11][
    create-link-with turtle 11]
end

to Usu-Liga
  let nuvi 1
  let rep qtd_usu - 1
  let i 1
  let j 1
  let k 0
  repeat qtd_nuvens[
    set i 1
    repeat rep[
      set j i + 1
      set k qtd_usu - i
      ask usuarios with[nuvem_tag_usu = nuvi and usu_tag = i][
        repeat k[
          let alguem one-of(usuarios with[(nuvem_tag_usu = nuvi) and (usu_tag = j)])
          create-link-with alguem [set link_tag link_t set usu1 i set usu2 j set nuvem_tag_link nuvi]
          set link_t link_t + 1
          set j j + 1
        ]
      ]
    set i i + 1
    ]
    set nuvi nuvi + 1
  ]
end

to Infectados-Comeco
  repeat infectados_inicial[
    ask one-of usuarios with[suscetivel? = 1][
      set infectado? 1
      set suscetivel? 0
      set color red
    ]
  ]
end

to Antidotal-Comeco
  repeat antidotais_inicial[
    ask one-of usuarios with[suscetivel? = 1][
      set antidoto? 1
      set suscetivel? 0
      set color blue
    ]
  ]
end

to infec2
  let usu_p 0
  let nuvem_p 0
  let nuvem_p2 0
  let usu_1 0
  let usu_2 0
  let kkk 0
  let transmissão 0
  repeat count usuarios with[infectado? = 1][
    ask usuarios with[infectado? = 1 and usu_visitado? = 0][
      set usu_p usu_tag
      set nuvem_p nuvem_tag_usu
      set usu_visitado? 1
    ]
    set transmissão (p_infec / 10) * count usuarios with [infectado? = 1] / p_remove
    repeat qtd_usu[
      ask nuvens with[nuvem_tag = nuvem_p][
        set nuvem_p2 one-of nuvem_link
      ]
      ifelse nuvem_p = nuvem_p2[
        ask links with[ nuvem_tag_link = nuvem_p and visitado? = 0 and(usu1 = usu_p or usu2 = usu_p)][
          set usu_1 usu1
          set usu_2 usu2
          set visitado? 1
        ]
        if usu_p = usu_1[
          if random 100 <= transmissão[
            if random 100 <= p_infec[
              ask usuarios with[usu_tag = usu_2 and nuvem_tag_usu = nuvem_p and suscetivel? = 1][
                set infectado? 1
                set color red
                set suscetivel? 0
                set removido? 0
                set antidoto? 0
                set usu_visitado? 1
             ]
            ]
          ]
        ]
        if usu_p = usu_2[
           if random 100 <= transmissão[
            if random 100 < p_infec[
              ask usuarios with[usu_tag = usu_1 and nuvem_tag_usu = nuvem_p and suscetivel? = 1][
                set infectado? 1
                set color red
                set suscetivel? 0
                set removido? 0
                set antidoto? 0
                set usu_visitado? 1
              ]
            ]
          ]
        ]
      ][
        ask usuarios with[nuvem_tag_usu = nuvem_p2 and suscetivel? = 1][
          if random 100 <= transmissão[
            if random 100 < p_infec[
              set infectado? 1
              set suscetivel? 0
              set removido? 0
              set antidoto? 0
              set color red
              set usu_visitado? 1
            ]
          ]
        ]
      ]
    ]
    ask links [set visitado? 0]
  ]
  ask usuarios [set usu_visitado? 0]
end

to removido
  let usu_rc 0
  let nuvem_rc 0
  repeat count usuarios with[infectado? = 1][
    ask usuarios with[infectado? = 1][
      set usu_rc usu_tag
      set nuvem_rc nuvem_tag_usu
    ]
    ask usuarios with[usu_tag = usu_rc and nuvem_tag_usu = nuvem_rc][
      if random 100 <= p_remove[
        set infectado? 0
        set removido? 1
        set suscetivel? 0
        set antidoto? 0
        set color orange
      ]
    ]
  ]
end

to antidotal
  let usu_rc 0
  let nuvem_rc 0
  repeat count usuarios with[infectado? = 1 or suscetivel? = 1][
    ask usuarios with [suscetivel? = 1 or infectado? = 1][
      set usu_rc usu_tag
      set nuvem_rc nuvem_tag_usu
    ]
    ask usuarios with[nuvem_tag_usu = nuvem_rc and usu_tag = usu_rc][
      ifelse suscetivel? = 1[
        if random 100 <= p_as[
          set suscetivel? 0
          set antidoto? 1
          set infectado? 0
          set removido? 0
          set color blue
        ]
      ][
        if random 100 <= p_ai[
          set infectado? 0
          set antidoto? 1
          set suscetivel? 0
          set removido? 0
          set color blue
        ]
      ]
    ]
  ]
end

to suscetivel
  let usu_rc 0
  let nuvem_rc 0
  repeat count usuarios with[removido? = 1][
    ask usuarios with[ removido? = 1][
      set usu_rc usu_tag
      set nuvem_rc nuvem_tag_usu
    ]
    ask usuarios with[usu_tag = usu_rc and nuvem_tag_usu = nuvem_rc][
      if random 100 <= p_susce[
        set suscetivel? 1
        set removido? 0
        set infectado? 0
        set antidoto? 0
        set color white
      ]
    ]
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
302
17
1103
819
-1
-1
13.0
1
10
1
1
1
0
0
0
1
0
60
0
60
1
1
1
ticks
30.0

SLIDER
0
13
172
46
qtd_nuvens
qtd_nuvens
2
12
12.0
1
1
NIL
HORIZONTAL

BUTTON
221
17
285
50
Setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
0
46
172
79
qtd_usu
qtd_usu
0
8
8.0
1
1
NIL
HORIZONTAL

BUTTON
220
50
283
83
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

PLOT
0
336
295
495
Estado das Populações
Ticks
População
0.0
30.0
0.0
96.0
true
true
"" ""
PENS
"Infectado" 1.0 0 -2674135 true "" "plot (count usuarios with [infectado? = 1]) "
"Suscetivel" 1.0 0 -16777216 true "" "plot count usuarios with [suscetivel? = 1]"
"Antidotal" 1.0 0 -13345367 true "" "plot count usuarios with [antidoto? = 1]"
"Removido" 1.0 0 -955883 true "" "plot count usuarios with[removido? = 1]"

SLIDER
0
77
172
110
infectados_inicial
infectados_inicial
1
96
16.0
1
1
NIL
HORIZONTAL

SLIDER
0
143
172
176
p_infec
p_infec
1
100
10.0
1
1
NIL
HORIZONTAL

SLIDER
0
174
172
207
p_remove
p_remove
0
100
15.0
1
1
NIL
HORIZONTAL

SLIDER
0
206
172
239
p_as
p_as
0
100
2.5
0.5
1
NIL
HORIZONTAL

SLIDER
0
239
172
272
p_ai
p_ai
0
100
25.0
1
1
NIL
HORIZONTAL

SLIDER
0
270
172
303
p_susce
p_susce
0
100
80.0
1
1
NIL
HORIZONTAL

SWITCH
0
303
172
336
p_antidotal?
p_antidotal?
0
1
-1000

SLIDER
0
110
172
143
antidotais_inicial
antidotais_inicial
1
96
1.0
1
1
NIL
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 3
false
0
Circle -7500403 false true 0 0 300

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
