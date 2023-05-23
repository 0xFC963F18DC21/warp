! Copyright (C) 2023 0xFC963F18DC21.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel locals parser syntax ;
USING: arrays quotations sequences vectors ;
USING: byte-arrays hashtables lists ;
IN: warp

<PRIVATE

: (split-last) ( vec -- hvec lvec )
    [ but-last ] [ last 1vector ] bi ;

:: (into-struct) ( acc end cons -- acc )
    acc (split-last)
    end parse-until
    cons call 1vector
    swap append! append! ; inline

PRIVATE>

! The principle behind how this word works is just to take the
! latest parsed item off the accumulator vector and leap-frog it
! in-front of the items within the warped block.

! It works for nested warping, which is a nice bonus :D

SYNTAX: ) delimiter ; ! This doesn't exist for some reason?
SYNTAX: ~( (split-last) \ ) parse-until swap append! append! ;
SYNTAX: ~[ \ ] [ >quotation ] (into-struct) ;
SYNTAX: ~{ \ } [ >array ] (into-struct) ;
SYNTAX: ~V{ \ } [ >vector ] (into-struct) ;
SYNTAX: ~H{ \ } [ >hashtable ] (into-struct) ;
SYNTAX: ~B{ \ } [ >byte-array ] (into-struct) ;
SYNTAX: ~L{ \ } [ >list ] (into-struct) ;
