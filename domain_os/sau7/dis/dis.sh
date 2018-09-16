#
# disassemble sau7 domain_os
#
D=~/src/domainos-archeology

load_addr=0x1002000
dis_addr=$1

rfc_header_bytes=0

offset=$(node -e "console.log(${dis_addr} - ${load_addr} + ${rfc_header_bytes})")

dd if=${D}/sr10.4-install/sau7/domain_os of=/tmp/domain_os bs=${offset} skip=1 > /dev/null 2>&1
${D}/binutils-gdb/binutils/objdump -D --adjust-vma=${dis_addr} -b binary -mm68k:68020 /tmp/domain_os
