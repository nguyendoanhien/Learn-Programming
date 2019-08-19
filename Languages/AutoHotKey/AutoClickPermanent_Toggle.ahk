F1::domino66Click()



domino66Click(Interval=0){

   static Toggler

   Toggler := !Toggler

   TPer := Toggler ? Interval : "off"

   SetTimer, ClickClick, %TPer%

   return

   ClickClick:

   Click

   return

}