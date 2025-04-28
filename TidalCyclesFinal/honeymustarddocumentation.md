it's 3 am,

i have nothing but the worst music fucking imaginable in the tidal file

it's still nowhere close to submittable

and i just remembered that i have to do documentation

fuck you

i am very annoyed about this project

not because of anything in particular about this one

im just overworked further than i ever have been in my life this and next week

gigantic projects treated casually by all of my teachers, all due a week before finals

making me have to cram it all at the end because there was no reason at all for me to work on any of it before hand, there was literally other work to do and none of it was made into a big deal

and on top of that i have my fuckign big final show this week that should be taking a majority of my time

not this fucking performance that isn't actually happening for a week

anyway

documentation:

# What's been done so far:
## before i remembered documentation is required
- Spent some time in supercollider trying to design more sounds so I'm not just reusing the ones i made for my final for that class, and instead have some unique noises for this
- realizing that most audio effects dont do fuckign anything to a sound if they dont have that effect programmed into their synth entirely, so by choosing to use my supercollider experience i am locking myself behind a much larger wall of effects to use unless i figure out how to make them myself. No Thank You!
- i brought in my own sample to use as the basis for some sort of humorous glue to tie this all together, because the only way i can make anythign worthwhile in this time frame (less than 12 hours) is if it is funny. Cuz i obviously can't make anyhting *good* right now
- chopping up and "beat-ifying" the sample with slice and clever use of begin
- got increasingly frustrated with the selection of default drum samples in tidal being just okay to me
- i can't write a beat for shit
- getting increasingly frustrated with the lack of in sync stuff for performances in tidal cycles (or at least any documentation for it)
- getting increasingly frustrated with the lack of composition features that i had in strudel that i relied on heavily for structuring the piece that i can't even begin to recreate in tidal
- i want to set my patterns as variables so i can use them and call them succinctly and at specific times and use them like patterns like they literally are, but either its not possible or there's no documentation about it so i can't possibly learn it
- mixing is the worst fuckign thing in the world in this language, it feels worse than in strudel
- i try writing a melody but it sucks ass

## some progress
- I have looked up some references that i am tryign to pull inspiration from to figure out how i can structure a song in tidal cycles
- [this one](https://www.youtube.com/watch?v=WT7zXVp21BQ&t=6446s) and [this one](https://www.youtube.com/watch?v=etAZbQtggSQ) have given some inspiration about what to do
- including! using the do function, cuz it really seems like my only option to do anything in sync with multiple instruments (IT SHOULD BE EASIER TO DO SHIT IN TIME WITH MULTIPLE PATTERNS BTW this feels like such a dumb and barbaric way to organize music)
- but since it's the option i have started to organize my music into sections of "do's", an issue im having is that i just want to update one of the patterns so that it changes the feel, but i dont want to have to redefine the entire thing with all of its effects restated just so i can change on of them at the same time as i change other channels
- i currently dont have a solution

# BIG DEVELOPMENT

finally found a some decenet explanation of the ur function and im a big fan

[good very good tutorial](https://club.tidalcycles.org/t/week-7-lesson-3-composing-tracks-with-the-ur-function/1340)

going to try to implement this immediately for much variation

# new updates

- learning the ways of "qtrigger" to make sure things start playing at the time of next cycle instead of exactly when i hit cmd enter, gives me more wiggle room to play it right, and sounds better more consistently
- also figured out, from one of those links earlier, that in fact you *can* affect all things at once with an affect, by literally just doing `all $ qtrigger` you can affect everything with a qtrigger it's convenient af

in terms of the music my stuff is become more listenable, it's still, i would consider, **bad** but i dont have much time to make it good so eh whatever

NEVERMIND ACTUALLY it doesn't seem to actually do the qtrigger correctly then i do `all $ qtrigger` that's awesome (i was relying on a qtrigger for timing purposes)

in the lase few hours i have now ""finalized"" the form and piece as a whole

i decided that i could make a quick hydra file that is just some unchanging but funny looking visual it can distract from the fact my music sucks

i worked a lot more with th ur function cuz i figured i should implement it more since it got me so excited

so now there's a lot more variation in the main long loop of the thing

im struggling with getting the xfade to entirely work with every channel i have, it works fine with the honeymustard samples, but with my supercollider synthdefs is does nothing unless i activate it twice, at which point it will immediately swap to the other thing, no fade at all!

just the desire to fade things out in general is a pretty fruitless one today, oh well.

