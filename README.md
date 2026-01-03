## rdap.ps1 — Check domain expiration date using RDAP
    
    PS > rdap                          
    rdap.ps1 — Check domain expiration date using RDAP
    Usage:
            rdap abc.com xyz.com
            'abc.com', 'xyz.com' | rdap


#### Example:



    PS > rdap youtube.com facebook.com tiktok.com instagram.com
    
    domain       registration expiration popularity
    ------       ------------ ---------- ----------
    youtube.com  2005-02-15   2026-02-15 2
    facebook.com 1997-03-29   2034-03-30 3
    tiktok.com   1996-07-21   2026-07-20 7
    instagram.c… 2004-06-04   2034-06-04 4

