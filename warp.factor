! Copyright (C) 2023 0xFC963F18DC21.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel parser quotations sequences syntax vectors ;
IN: warp

<PRIVATE

: (split-last) ( vec -- hvec lvec ) [ but-last ] [ last 1vector ] bi ;

PRIVATE>

SYNTAX: ) delimiter ; ! This doesn't exist for some reason?
SYNTAX: ~( (split-last) \ ) parse-until swap append! append! ;
SYNTAX: ~[ (split-last) \ ] parse-until >quotation 1vector swap append! append! ;
