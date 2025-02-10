```
s ("[bd ~ ~ [bd bd]]!4? , [~ sd]!2")
s ("<bd [hh!2]? sd hh bd [hh!2]? hh [hh!3]>*8").cpm(150/4)
$: note("c2 g3 bb3 eb4").s("square")
stack( "[bd ~ ~ bd] [~ ~ ~ bd] [~ bd bd ~] [~ ~ ~ ~] ", 
       "[~ ~ ~ ~] [sd ~ ~ ~] [~ ~ ~ ~] [sd ~ ~ ~] ", 
       "[hh ~ hh ~] [hh ~ hh ~] [hh ~ ~ ~] [hh ~ hh ~] ", 
       "[~ ~ ~ ~] [ho ~ ~ ~] [~ ~ ho ~] [~ ~ ~ ~] "
     ).s()

$: (note("[~ 61 62 74] [73 ~ ~ 69 ~ ~ 66 ~] [67 ~ ~ 69 ~ ~ 62] [62 ~]")).s("square")
stack("[bd ~ ~ bd] [~ bd] bd <[~ bd] [~ bd ~ ~ ]>",
"~ sd ~ <cp sd>",
"[hh? [hh hh?]]*4".velocity(0.6)).s()
```