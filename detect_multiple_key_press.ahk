detect_multiple_key_press(kkey, ddelay) {   ; up to 4  ; delay 0.2 is ok
      presses:=1
      KeyWait, %kkey%        ; Wait for user to physically release it
      KeyWait, %kkey%, D T%ddelay%
      if (errorlevel = 0) {  ; we get double press
         KeyWait, %kkey%
         KeyWait, %kkey%, D T%ddelay%
         if (errorlevel = 0) { ; we get triple press
            KeyWait, %kkey%
            KeyWait, %kkey%, D T%ddelay%
            if (errorlevel = 0)  ; we get quadriple press
               presses:=4
            else
               presses:=3
         }
         else
            presses:=2
      }
      return presses
}

^t::
   switch  detect_multiple_key_press("t", 0.2)  {
      case 1:
               ; some action for single press
      case 2:
               ; some action for double press
      case 3:
               ; some action for triple press
      case 4:
               ; some action for quadruple press
   }
   return
