((c-mode . ((indent-tabs-mode . nil)
            (tab-width . 2)
            (c-basic-offset . 2)
            (compile-command . (concat "gcc -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -include AutoGen.h -fno-common -DSTRING_ARRAY_NAME=sfcStrings -m64 -fno-stack-protector \"-DEFIAPI=__attribute__((ms_abi))\" -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie -fno-asynchronous-unwind-tables -Wno-address -Os -DSFC_DEBUG -DCHECKOUT=85a65a4e9ec5b2778350b5234329fe3d1893146d -D DISABLE_NEW_DEPRECATED_INTERFACES -c -o /tmp/uefi.obj -I/home/tp/sauce/uefi/buildtree/sfc/src/uefi_protocols -I/home/tp/sauce/uefi/buildtree/sfc/src/sfc_hunt -I/home/tp/sauce/uefi/buildtree/sfc/src/sfc_siena -I/home/tp/sauce/uefi/buildtree/sfc/src/efx -I/home/tp/sauce/uefi/buildtree/sfc/src -I/home/tp/sauce/uefi/buildtree/sfc/src/lib/sfgpxe -I/home/tp/sauce/uefi/buildtree/sfc/src/lib -I/home/tp/sauce/uefi/buildtree/sfc/src/lib-uefi -I/home/tp/sauce/uefi/buildtree/sfc/lib/tlv -I/home/tp/sauce/uefi/buildtree/sfc/lib/hii -I/home/tp/sauce/uefi/buildtree/sfc/lib -I/home/tp/sauce/uefi/buildtree/sfc/lib/mcdi -I/home/tp/sauce/uefi/buildtree/sfc -I/home/tp/sauce/uefi/buildtree/Build/MdeModule/DEBUG_GCC49/X64/sfc/sfc/DEBUG -I/home/tp/sauce/uefi/buildtree/MdePkg -I/home/tp/sauce/uefi/buildtree/MdePkg/Include -I/home/tp/sauce/uefi/buildtree/MdePkg/Include/X64 -I/home/tp/sauce/uefi/buildtree/MdeModulePkg -I/home/tp/sauce/uefi/buildtree/MdeModulePkg/Include " buffer-file-name))
            (compilation-read-command . nil)
            (projectile-compilation-command . "make MODE=DEBUG all")
            (flycheck-gcc-args . ("-fno-builtin" "-DSFC_DEBUG"))
            (flycheck-gcc-includes . ("AutoGen.h"))
            (flycheck-gcc-include-path . ("/home/tp/sauce/uefi/buildtree/sfc/src/uefi_protocols"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/sfc_hunt"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/sfc_siena"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/lib/sfgpxe"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/lib"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/lib-uefi"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src"
                                          "/home/tp/sauce/uefi/buildtree/sfc/lib"
                                          "/home/tp/sauce/uefi/buildtree/sfc/lib/hii"
                                          "/home/tp/sauce/uefi/buildtree/sfc/lib/mcdi"
                                          "/home/tp/sauce/uefi/buildtree/sfc/lib/tlv"
                                          "/home/tp/sauce/uefi/buildtree/sfc/src/efx"
                                          "/home/tp/sauce/uefi/buildtree/sfc"
                                          "/home/tp/sauce/uefi/buildtree/Build/MdeModule/DEBUG_GCC49/X64/sfc/sfc/DEBUG"
                                          "/home/tp/sauce/uefi/buildtree/MdePkg"
                                          "/home/tp/sauce/uefi/buildtree/MdePkg/Include"
                                          "/home/tp/sauce/uefi/buildtree/MdePkg/Include/X64"
                                          "/home/tp/sauce/uefi/buildtree/MdeModulePkg"
                                          "/home/tp/sauce/uefi/buildtree/MdeModulePkg/Include"))
            (ffap-c-path . ("/usr/include"
                            "/usr/local/include"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/uefi_protocols"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/sfc_hunt"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/sfc_siena"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/lib/sfgpxe"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/lib"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/lib-uefi"
                            "/home/tp/sauce/uefi/buildtree/sfc/src"
                            "/home/tp/sauce/uefi/buildtree/sfc/lib/hii"
                            "/home/tp/sauce/uefi/buildtree/sfc/lib"
                            "/home/tp/sauce/uefi/buildtree/sfc/lib/mcdi"
                            "/home/tp/sauce/uefi/buildtree/sfc/lib/tlv"
                            "/home/tp/sauce/uefi/buildtree/sfc/src/efx"
                            "/home/tp/sauce/uefi/buildtree/sfc"
                            "/home/tp/sauce/uefi/buildtree/Build/MdeModule/DEBUG_GCC49/X64/sfc/sfc/DEBUG"
                            "/home/tp/sauce/uefi/buildtree/MdePkg"
                            "/home/tp/sauce/uefi/buildtree/MdePkg/Include"
                            "/home/tp/sauce/uefi/buildtree/MdePkg/Include/X64"
                            "/home/tp/sauce/uefi/buildtree/MdeModulePkg"
                            "/home/tp/sauce/uefi/buildtree/MdeModulePkg/Include"))
            (flycheck-disabled-checkers . nil))
         ))
