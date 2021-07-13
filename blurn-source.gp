clear_screen
myPC = get_shell.host_computer
mP = null
sRes = []
sUnm = []
sIP = []
pIP = []
sport = []
saMem = []
saVal = []
result = null
ftpok = false
adr = null
port = null

//p = "2689609cb915e75b1c404f4ae693e7ad" //md5 encrypted
//h = user_input("|:>", 1)
//if md5(h) != p then exit

if active_user == "root" then
    mP = "/root/kit/resources"
else
    print("\nNo root\nProceed?")
    print("\n2: Yes")
    print("1: No")
    yorn = user_input("\n|:> ")
    if yorn == "1" then 
        exit
    else 
        mP = "/home/guest/kit/resources"
    end if
end if

mkit = function()
    if myPC.File(mP) == null then 
        myPC.create_folder(current_path, "kit")
        myPC.create_folder(current_path+"/kit", "other")
        myPC.create_folder(current_path+"/kit", "resources")
        myPC.create_folder(current_path+"/kit/resources", "libs")
        mP = current_path+"/kit/resources" 
    end if
end function
mkit

libc = null
crypt = myPC.File("/lib/crypto.so")
if not crypt then crypt = myPC.File(current_path+"/crypto.so")
if not crypt then crypt = myPC.File(mP+"/crypto.so")
if not crypt then crypt = myPC.File(mP+"/libs/crypto.so")
if not crypt then crypt = myPC.File("/root/crypto.so")
if not crypt then crypt = myPC.File("/home/guest/crypto.so")

if not crypt then
    print("\nNo crypto.so\nProceed?")
    print("\n2: Yes")
    print("1: No")
    libchk = user_input("\n|:> ").to_int
    if libchk == 1 then exit
    if libchk != 1 and libchk != 2 then exit
    libc = true
end if

libm = null
mxp = myPC.File("/lib/metaxploit.so")
if not mxp then mxp = myPC.File(current_path+"/metaxploit.so")
if not mxp then mxp = myPC.File(mP+"/metaxploit.so")
if not mxp then mxp = myPC.File(mP+"/libs/metaxploit.so")
if not mxp then mxp = myPC.File("/root/metaxploit.so")
if not mxp then mxp = myPC.File("/home/guest/metaxploit.so")

if not mxp then
    print("\nNo metaxploit.so\nProceed?")
    print("\n2: Yes")
    print("1: No")
    libchk = user_input("\n|:> ").to_int
    if libchk == 1 then exit
    if libchk != 1 and libchk != 2 then exit
    libm = true
end if

if not libm then
    mx = include_lib("/lib/metaxploit.so")
    if not mx then mx = include_lib(current_path+"/metaxploit.so")
    if not mx then mx = include_lib(mP+"/metaxploit.so")
    if not mx then mx = include_lib(mP+"/libs/metaxploit.so")
    if not mx then mx = include_lib("/root/metaxploit.so")
    if not mx then mx = include_lib("/home/guest/metaxploit.so")
end if

if not libc then
    cryp = include_lib("/lib/crypto.so")
    if not cryp then cryp = include_lib(current_path+"/crypto.so")
    if not cryp then cryp = include_lib(mP+"resources/crypto.so")
    if not cryp then cryp = include_lib(mP+"/libs/crypto.so")
    if not cryp then cryp = include_lib("/root/crypto.so")
    if not cryp then cryp = include_lib("/home/guest/crypto.so")
end if 

blrn = myPC.File("/bin/blurn")
if not blrn then blrn = myPC.File(current_path+"/blurn")
if not blrn then blrn = myPC.File("/root/blurn")
if not blrn then blrn = myPC.File("/home/guest/blurn")
if not blrn then blrn = myPC.File("/bin/blrn")
if not blrn then blrn = myPC.File(current_path+"/blrn")
if not blrn then blrn = myPC.File("/root/blrn")
if not blrn then blrn = myPC.File("/home/guest/blrn")

mfiles = function()
    rF1 = myPC.File(mP+"/cast")
    if not rF1 then myPC.touch(mP, "cast")
    rF2 = myPC.File(mP+"/nocast")
    if not rF2 then myPC.touch(mP, "nocast")
    eml = myPC.File(mP+"/mail")
    if not eml then myPC.touch(mP, "mail")
    bnk = myPC.File(mP+"/bank")
    if not bnk then myPC.touch(mP, "bank")
    pfl = myPC.File(mP+"/pass")
    if not pfl then myPC.touch(mP, "pass")
    shells = myPC.File(mP+"/pwnList")
    if not shells then myPC.touch(mP, "pwnList")
    ipList = myPC.File(mP+"/ipList")
    if not ipList then myPC.touch(mP, "ipList")
    logs = myPC.File(mP+"/system.log")
    if not logs then myPC.touch(mP, "system.log")
    pls = myPC.File(mP+"/pList")
    if not pls then myPC.touch(mP, "pList")
    cF = myPC.File(mP+"/catFile")
    if not cF then myPC.touch(mP, "catFile")  
    tFile = myPC.File(mP+"/temp")
    if not tFile then myPC.touch(mP, "temp")  
    resFile = myPC.File(mP+"/results")
    if not resFile then myPC.touch(mP, "results")
end function
mfiles

rF1 = myPC.File(mP+"/cast")
rF2 = myPC.File(mP+"/nocast")
eml = myPC.File(mP+"/mail")
bnk = myPC.File(mP+"/bank")
pfl = myPC.File(mP+"/pass")
shells = myPC.File(mP+"/pwnList")
ipList = myPC.File(mP+"/ipList")
logs = myPC.File(mP+"/system.log")
pls = myPC.File(mP+"/pList")
cF = myPC.File(mP+"/catFile")
tFile = myPC.File(mP+"/temp")
resFile = myPC.File(mP+"/results")

bnr = function(result)
    clear_screen
    print("<size=75%> <color=#6467fe>Blurn </color>'<color=green>help</color>': options. '<color=yellow>menu</color>': menu. '<color=red>exit</color>': quit")
    if get_shell.host_computer.is_network_active == true then 
        w = get_router.local_ip
        if not w then w = get_router
        x = null
        y = get_shell.host_computer.local_ip
        if adr then x = "<color=white> -=[ "+adr+"</color>:<color=white>"+port
        if result then x = " -=[<color=#e93855> "+typeof(result)+"</color>@<color=white>"+adr+"</color>:<color=white>"+port
        print("<size=75%> "+w+" <color=white><size=50%>"+current_date+"<size=75%></color> <color=#11a42c>"+active_user+"</color>@<color=#11a42c>local</color> <color=white>"+y+" "+"</color><size=60%>"+x+"\n")
    else
        print("\n")
    end if
end function

mm = function()
    okm = false
    while okm != true
        bnr
        print("<b> <size=75%> 12</b>:</size> VDB             [<color=#6467fe><size=75%>vuln db</color></size>]")
        print("<b> <size=75%> 11</b>:</size> PLAYBOOK        [<color=#6467fe><size=75%>saved results</color></size>]")
        print("<b> <size=75%> 10</b>:</size> RUMMAGE         [<color=#6467fe><size=75%>filesystem</color></size>]")
        print("<b>  9</b>: RETRIEVE        [<color=#6467fe><size=75%>open/view</color></size>]")
        print("<b>  8</b>: MANIFEST        [<color=#6467fe><size=75%>manage system</color></size>]")
        print("<b>  7</b>: MAINSAIL        [<color=#6467fe><size=75%>crack wifi</color></size>]")
        print("<b>  6</b>: DIG             [<color=#6467fe><size=75%>decipher</color></size>]")
        print("<b>  5</b>: STOW            [<color=#6467fe><size=75%>lock file</color></size>]")
        print("<b>  4</b>: WIPER           [<color=#6467fe><size=75%>clean/update</color></size>]")
        print("<b>  3</b>: BOARD           [<color=#6467fe><size=75%>connect</color></size>]")
        print("<b>  2</b>: CAST            [<color=#6467fe><size=75%>pentest</color></size>]")
        print("<b>  1</b>: SPYGLASS        [<color=#6467fe><size=75%>netscan</color></size>]")
        opt = user_input("\n |:>  ")
        menu = opt
        back(menu)
        opt = opt.to_int
        if opt == 12 then vdb
        if opt == 11 then sResults
        if opt == 10 then rummage
        if opt == 9 then retrieve
        if opt == 8 then manifest
        if opt == 7 then mainsail
        if opt == 6 then dig
        if opt == 5 then stow
        if opt == 4 then wiper
        if opt == 3 then board
        if opt == 2 then cast
        if opt == 1 then spyglass
    end while
end function

back = function(menu)
    if menu == "help" then
        print("\n<color=#0066ff>Global cmds\n \nmenu\nexit\n \nrsi\nsniff\nping\nscan\nsmtp\nlookup\nifconfig\n \nchown\nchgrp\ntouch\nmkdir\nbuild\nrm\nmv\ncp\ncat\nps\nkill\n \npass\nlist\npurge\nmkit\n \nvdb\nplaybook\nroster\nrummage\nretrieve\nmanifest\nmainsail\ndig\nstow\nwiper\nboard\ncast\nspyglass\n")
        user_input("Back\n")
    end if
    if menu == "mkit" then 
        myPC.File(mP).delete
        mkit
        mfiles
    end if
    if menu == "rsi" then rsi
    if menu == "sniff" then sniff
    if menu == "ping" then ping
    if menu == "scan" then lscan
    if menu == "smtp" then smtp
    if menu == "lookup" then lookup
    if menu == "ifconfig" then ifconfig
    if menu == "chown" then chown
    if menu == "chgrp" then chgrp
    if menu == "touch" then touch
    if menu == "mkdir" then mkdir
    if menu == "build" then build
    if menu == "rm" then rem
    if menu == "mv" then mve
    if menu == "cp" then cpy
    if menu == "cat" then cat
    if menu == "pass" then passf
    if menu == "ps" then ps
    if menu == "kill" then kill
    if menu == "purge" then purge
    if menu == "list" then getFiles
    if menu == "vdb" then vdb
    if menu == "playbook" then sResults
    if menu == "roster" then roster
    if menu == "rummage"then rummage
    if menu == "retrieve" then retrieve
    if menu == "manifest" then manifest
    if menu == "mainsail" then mainsail
    if menu == "dig" then dig
    if menu == "stow" then stow
    if menu == "wiper" then  wiper
    if menu == "board" then board
    if menu == "cast" then cast
    if menu == "spyglass" then spyglass
    if menu == "menu" then mm
    if menu == "exit" then exit("Done\n")
end function

vdb = function()
    bnr
    print("<color=#6467fe>BVDB")
    print("<size=75%>'wipe': clear history\n")
    dbmInfo = "* RESULT USER PUBLIC LOCAL PORT LIB VERSION MEMORY ADDRESS"
    dbInfo = ""
    resFile = myPC.File(mP+"/results")
    vLines = resFile.get_content.split("\n")
    dbCount = vLines.len
    for line in vLines
        if line.len == 0 or line == [] or line == "" then continue
        bits = line.split(":")
        dbInfo = dbInfo+dbCount+": "+bits[1]+" "+bits[0]+" "+bits[2]+" "+bits[3]+" "+bits[4]+" "+bits[5]+" "+bits[6]+" "+bits[7]+" "+bits[8]+" "+"\n"
        dbCount = dbCount-1
    end for
    if dbInfo != "" then
        print(format_columns(dbmInfo+"\n"+dbInfo))
    else
        print("No info")
    end if
    x = user_input("\n   Back\n")
    if x == "wipe" then resFile.set_content("")
end function

go = function(gocon)
    gomin = null
    adr = user_input("\n<color=#0066ff>IP</color>  |:> ")
    menu = adr
    back(menu)
    ct = 0
    for c in adr
        ct = ct+1
    end for
    if ct > 16 then
        gomin = true
        sp = adr.split(":")
        rps = sp[0]
        adr = sp[1]
    end if
    if is_valid_ip(adr) then 
        print("\n<size=75%><color=#8b35ff>Enter</color>: port '22' as 'root'\n")
        port = user_input("<color=#0066ff>Port</color>  |:> ").to_int
        menu = port
        back(menu)
        if not port or port == "" then 
            port = 22
            user = "root"
            service = 2
        else
            user = user_input("\n<color=#0066ff>User</color>  |:> ") 
            menu = user
            back(menu)  
            print("\n2: SSH")
            print("1: FTP")
            service = user_input("\n|:> ").to_int
            menu = service
            back(menu)
        end if
        if gomin != true then rps = user_input("\n<color=#0066ff>Pass</color>  |:> ") 
        if gocon == null then
            if service == 2 then shell = get_shell.connect_service(adr, port, user, rps) 
            if service == 1 then shell = get_shell.connect_service(adr, port, user, rps, "ftp") 
            if shell then loader(shell)
        else
            if service == 2 then shell = get_shell.connect_service(adr, port, user, rps) 
            if service == 1 then shell = get_shell.connect_service(adr, port, user, rps, "ftp") 
            if shell then shell.start_terminal
        end if
    end if
end function

setPerms = function(dirs)
    if dirs then
        for dir in dirs
            dir.set_group("root", 1)
            dir.set_owner("root", 1)
            dir.chmod("u-wrx", 1)
            dir.chmod("g-wrx", 1)
            dir.chmod("o-wrx", 1)
            if dir.name == "server" then dir.delete     
        end for
    end if
end function

addPerms = function(dirs)
    if dirs then
        for dir in dirs
            dir.set_group("guest", 1)
            dir.set_owner("guest", 1)
            dir.chmod("u+wrx", 1)
            dir.chmod("g+wrx", 1)
            dir.chmod("o+wrx", 1)
        end for
    end if
end function

rClean = function(shell)
    guest = shell.host_computer.File("/home/guest")
    t1 = shell.host_computer.File("/root/.Trash")
    sudo = shell.host_computer.File("/bin/sudo")
    bnk = shell.host_computer.File("/root/Config/Bank.txt")
    eml = shell.host_computer.File("/root/Config/Mail.txt")
    pass = shell.host_computer.File("/etc/passwd") 
    if eml then eml.delete
    if bnk then bnk.delete
    if guest then guest.delete
    if t1 then t1.delete
    if sudo then sudo.delete
    if pass then pass.delete
    home = shell.host_computer.File("/home")
    if home then
        for user in home.get_folders
            user = user.name
            t2 = shell.host_computer.File("/home/"+user+"/.Trash")
            bnk = shell.host_computer.File("/home/"+user+"/Config/Bank.txt")
            eml = shell.host_computer.File("/home/"+user+"/Config/Mail.txt")
            if bnk then bnk.delete
            if eml then eml.delete 
            if t2 then t2.delete
        end for
    end if
end function

rUpd = function()
    gocon = "x"
    shell = null
    go(gocon)
    if shell then 
        print("\nUpdate libs?")
        print("\n2: Yes")
        print("1: No")
        upopt = user_input("\n|:>  ")
        menu = upopt
        back(menu)
        print("\nSet permissions")
        print("\n3: Allow all")
        print("2: Deny all")
        print("1: No thanks")
        opt = user_input("\n|:> ").to_int  
        menu = opt
        back(menu)
        if opt == 3 then
            dir = shell.host_computer.File("/")
            if dir then dirs = dir.get_folders
            addPerms(dirs)
        end if  
        if opt == 2 then
            dir = shell.host_computer.File("/")
            if dir then dirs = dir.get_folders
            rClean(shell)
            if upopt == 2 then
                get_shell.scp("/lib/init.so", "/lib", shell)
                get_shell.scp("/lib/net.so", "/lib", shell)
                get_shell.scp("/lib/kernel_module.so", "/lib", shell)
            end if
            setPerms(dirs)
        end if
        get_shell.scp(logs.path, "/var", shell)
    end if
end function

loader = function(shell)
    okl = false
    rPC = shell.host_computer
    while okl != true
        bnr
        print("\n6: Upload")
        print("5: Download")
        print("4: Drop rshell payload")
        print("3: Drop attack kit")
        print("2: Manage log")
        print("1: Back")
        opt = user_input("\n|:> ").to_int
        menu = opt
        back(menu)
        if opt == 6 then
            from = user_input("\n/Local/path  |:> ")
            menu = from
            back(menu)
            to = user_input("\n/Remote/path  |:> ")
            menu = to
            back(menu)
            if from then from = get_shell.host_computer.File(from).path
            if to then to = rPC.File(to).path
            if from and to then get_shell.scp(from, to, shell)
        else if opt == 5 then
            from = user_input("\n/Remote/path  |:> ")
            menu = from
            back(menu)
            if from then from = shell.host_computer.File(from).path
            menu = from
            back(menu)
            if ftpok != true then shell.scp(from, current_path, get_shell)
            if ftpok == true then shell.get(from, current_path, get_shell)
        else if opt == 4 then
            hS = user_input("\nHost IP  |:> ")
            menu = hS
            back(menu)
            get_shell.host_computer.touch("/home/guest", ".py.src")
            guest = rPC.File("/home/guest")
            pay = get_shell.host_computer.File("/home/guest/.py.src")
            pay.set_content("metaxploit = include_lib(""/home/guest/.metaxploit.so"")\nmetaxploit.rshell_client("""+hS+""",1222,""Terminal"")")
            get_shell.build("/home/guest/.py.src", "/home/guest")
            pay.delete
            if ftpok != true then
                get_shell.scp("/home/guest/.py", "/home/guest", shell)
                mxp.copy("/home/guest", ".metaxploit.so")
                get_shell.scp("/home/guest/.metaxploit.so", "/home/guest", shell)
                shell.launch("/home/guest/.py")
                hid = rPC.File("/home/guest/.py")
                met = rPC.File("/home/guest/.metaxploit.so")
                hid.delete
                met.delete
            else if ftpok == true then
                get_shell.put("/home/guest/.py", "/home/guest", shell)
                mxp.copy("/home/guest", ".metaxploit.so")
                get_shell.put("/home/guest/.metaxploit.so", "/home/guest", shell)
                shell.launch("/home/guest/.py")
                hid = rPC.File("/home/guest/.py")
                met = rPC.File("/home/guest/.metaxploit.so")
                hid.delete
                met.delete
            end if
            pay2 = myPC.File("/home/guest/.py")
            pay2.delete  
            get_shell.scp(logs.path, "/var", shell)
        else if opt == 3 then
            a = mxp.path
            b = crypt.path
            c = blrn.path
            dest = user_input("\nDest/path  |:> ")
            menu = dest
            back(menu)
            if dest then
                paus = true
                if shell and ftpok == false then
                    get_shell.scp(a, dest, shell)
                    get_shell.scp(b, dest, shell)
                    get_shell.scp(c, dest, shell)
                else if shell and ftpok == true then
                    get_shell.put(a, dest, shell)
                    get_shell.put(b, dest, shell)
                    get_shell.put(c, dest, shell)
                end if
            end if
        else if opt == 2 then
            print("\n3: Download")
            print("2: Corrupt")
            print("1: Back")
            lC = user_input("\n|:> ").to_int
            menu = lC
            back(menu)
            if lC == 3 then
                ok1 = true
                if ftpok != true then shell.scp("/var/system.log", current_path, get_shell)
                if ftpok == true then shell.get("/var/system.log", current_path, get_shell)
            else if lC == 2 then
                ok1 = true
                if ftpok != true then get_shell.scp(mP+"/system.log", "/var", shell)
                if ftpok == true then get_shell.put(mP+"/system.log", "/var", shell)
            end if
            if lC == 1 then ok1 = true
        end if
        if opt == 1 then okl = true
    end while
end function

purge = function()
    if mxp then mxp.delete
    if crypt then crypt.delete
    if blrn then blrn.delete
    home = myPC.File("/home")
    if home then 
        users = home.get_folders
        for user in users
            if user.name == "guest" then 
                user.delete
            else
                trash = myPC.File("/home/"+user+"/.Trash")
                if trash then trash.delete
                myPC.create_folder("/home/"+user, ".Trash")
            end if
        end for
    end if
    kit = myPC.File("/root/kit")
    if kit then kit.delete
    kit2 = myPC.File("/home/guest")
    if kit2 then kit2.delete
    rtrash = myPC.File("/root/.Trash")
    if rtrash then rtrash.delete
    myPC.create_folder("/root/", ".Trash")
    myPC.touch("/", "system.log")
    log2 = myPC.File("/system.log")
    log2.move("/var", "system.log")
    exit
end function

rsi = function()
    shells = []
    while shells.len == 0	
        shells = mx.rshell_server
        if(typeof(shells) == "string") then exit(shells)	
        if(shells.len == 0) then wait(2)
    end while

    option = 0
    while typeof(option) != "number" or (option < 1 or option > shells.len)
        if option == null or option == "" then mm
        print(shells.len + " Slct")
        for i in range(0, shells.len - 1)
            print("\n<b>Shell (" + (i + 1) + ")</b>\nIP: " + shells.host_computer.public_ip + "\nIP: " + shells.host_computer.local_ip)
        end for
        option = user_input("Slct>").to_int
    end while
    shells[option - 1].start_terminal
end function

sniff = function()
    print("\n...")
    if not mx then 
        mm
        print("No lib")
    end if
    out = mx.sniffer()
    if out then print(out)
    user_input("Back")
end function

smtp = function()
    ip = user_input("\nIP:  |:> ")
    menu = ip
    back(menu)
    port =  user_input("\nPort:  |:> ")
    menu = port
    back(menu)
    users = cryp.smtp_user_list(ip, port.to_int)
    if(typeof(users) == "string") then print(users)
    for user in users
        print(user)
    end for
    user_input("\n   Back")
end function

lscan = function()
    r = get_router
    if not r or not myPC.is_network_active then mm
    ips = r.devices_lan_ip
    print("\n"+r.local_ip + " ok\n")
    for ip in ips
        print("IP " + ip + " ok")
    end for
    user_input("\n   Back")
end function

ifconfig = function(chk)
    gw = null
    lip = null
    pip = null
    output = null
    print("\n")
    r = get_router    
    if myPC.is_network_active then
        if myPC.local_ip then lip = myPC.local_ip
        if r.public_ip then pip = r.public_ip
        if myPC.network_gateway then gw = myPC.network_gateway
        if myPC.active_net_card == "WIFI" then output = "Ess: " + r.essid_name + "\nBss: " + r.bssid_name
    end if
    print( output + "\n" + pip + "\n" + lip + "\n" + gw + "\n")
    if not chk then chk = user_input("   Back\n")
end function

lookup = function()
    add = user_input("\nURL:  |:> ")
    menu = add
    back(menu)
    print(nslookup(add))
end function

ping = function()
    p = user_input("\nIP:  |:> ")
    menu = p
    back(menu)
    result = get_shell.ping(p)
    if result and typeof(result) != "string" then print("OK")
end function

ps = function()
    output = myPC.show_procs
    print(format_columns(output))
    chk = user_input("\nBack")
    menu = chk
    back(menu)
end function

kill = function()
    PID = user_input("PID:  |:> ")
    menu = PID
    back(menu)
    if typeof(PID) == "number" then
        o = myPC.close_program(PID)
        if o == true then print(PID + " done")
        if o != true then print(nokill)
    end if
end function

passf = function()
    pU = user_input("\nUser  |:> ")
    menu = pU
    back(menu)
    menu = pU
    back(menu)
    inP = user_input("\nPass  |:> ")
    menu = inP
    back(menu)
    menu = inP
    back(menu)
    output = myPC.change_password(pU, inP)
end function

chown = function()
    owner = user_input("\nUser:  |:> ")
    menu = owner
    back(menu)
    fpath = user_input("\n/File/paath")
    menu = fpath
    back(menu)
    print("\nRecursive?")
    print("\n2: Yes")
    print("1: No")
    rec = user_input("\n|:> ").to_int
    if rec == 2 then
        recopt = 1
    else
        recopt = 0
    end if
    fil = myPC.File(fpath)
    fil.set_owner(owner, recopt)
end function

chgrp = function()
    owner = user_input("\nUser:  |:> ")
    menu = owner
    back(menu)
    fpath = user_input("\n/File/path  |:> ")
    menu = fpath
    back(menu)
    print("\nRecursive?")
    print("\n2: Yes")
    print("1: No")
    rec = user_input("\n|:> ").to_int
    menu = rec
    back(menu)
    if rec == 2 then
        recopt = 1
    else
        recopt = 0
    end if
    fil = myPC.File(fpath)
    ofil.set_group(group, recopt)
end function

build = function()
    pathSource = user_input("\n/File/path  |:> ")
    programP = user_input("\n/Dest/path  |:> ")
    menu = programP
    back(menu)
    fileSource = myPC.File(pathSource)
    folderDest = myPC.File(programP)
    get_shell.build(fileSource.path, folderDest.path)
end function

mkdir = function()
	fpath = user_input("\n/Path/to/file  |:> ")
    menu = fpath
    back(menu)
	pP = parent_path(fpath)
	existFile = myPC.File(fpath)
	if pP == fpath then pP = current_path
	p = myPC.File(pP)
	if p then
		aP = fpath.split("/")
		myPC.create_folder(p.path, aP[aP.len - 1])
	end if
end function

touch = function()
    fpath = user_input("\n/Path/name  |:> ")
    menu = fpath
    back(menu)
    pP = parent_path(fpath)
    if pP == fpath then pP = current_path
    p = myPC.File(pP)
    aP = fpath.split("/")
    myPC.touch(p.path, aP[aP.len - 1])
end function

rem = function()
    iR = 0
    fpath = user_input("\n/File/path  |:> ")
    menu = fpath
    back(menu)
    fi = myPC.File(fpath)
    if fi then fi.delete
end function

mve = function() 
	fl = user_input("\n/File/path  |:> ")
	df = user_input("\n/Dest/path  |:> ")
    menu = df
    back(menu)
	fi = myPC.File(fl)
	if not fi then
	else
		nN = ""
		fol = myPC.File(df)
		if not fol then
			pP = parent_path(df)	
			if pP == df then			
				nN = df
				df = fi.parent.path		
				fi.move(df, nN)
			else
				fol = myPC.File(pP)
				nN = df[df.len - (df.len - pP.len):]			
				if nN[0] == "/" then nN = nN[1:]	
			end if
		end if
		if fol then
			if fi.parent.path != fol.parent.path or fi.name != fol.name then
				fD = fol.path
				if(nN.len == 0) then nN = fi.name
				if not fol.is_folder then			
					fD = fi.parent.path
					nN = fol.name
				end if
				if fi.parent.path == fol.parent.path and nN != fi.name then
					fi.rename(nN)
				else
					fi.move(fD, nN)
				end if
			end if
		end if
	end if  
end function

cpy = function()
    fl = user_input("\n/File/path  |:> ")
    df = user_input("\n/Dest/path  |:> ")
    menu = df
    back(menu)
    cpfile = myPC.File(fl)
    nN = ""
    fol = myPC.File(df)
    if not fol then
        pP = parent_path(df)			
        if pP == df then			
            nN = df
            df = cpfile.parent.path		
            cpfile.copy(df, nN)
        end if	
        fol = myPC.File(pP)
        nN = df[df.len - (df.len - pP.len):]			
        if nN[0] == "/" then nN = nN[1:]
    end if
    if folder then	
        if fi.parent.path != fol.parent.path or fi.name != der.name then
            fD = fol.path	
            if(nN.len == 0) then nN = fi.name
            if not fol.is_folder then			
                fD = fi.parent.path
                nN = fol.name
            end if
            fi.copy(fD, nN)
        end if
    end if
end function

cat = function(path, pathx)
    if path then
        if path.get_content and path.has_permission("r") then print("\n"+path.get_content)
        cF.set_content(path.get_content+"\n"+cF.get_content+"\n")
        user_input("Back")
    else
        path = user_input("\nFull/path  |:> ")
        menu = path
        back(menu)
        print
        menu = path
        back(menu)
        cFile = myPC.File(path)
        if cFile.get_content then 
            print(cFile.get_content)
            cF = myPC.File(mP+"/cF")
            cF.set_content(cFile.get_content+"\n"+cF.get_content)
        end if
        user_input("\n   Back")
    end if
end function

getFiles= function(rfile)
    bnr
    if result != null then
        gfile = rfile
    else
        gfile = myPC.File("/")
    end if
    while gfile.parent != null
        gfile=gfile.parent
    end while
    Ds=gfile.get_folders
    low=0 
    high=Ds.len-1
    while true
        for i in range(low,high)
            Ds=Ds+Ds[i].get_folders
        end for
        if Ds.len == high+1 then break 
        low=high+1
        high=Ds.len-1
    end while
    for d in Ds
        print("\n<size=90%><color=#0066ff>"+d.path)
        fls=d.get_files
        fos=d.get_folders
        for fo in fos
            print("<size=80%><color=#6467fe>"+fo.name+"</color><size=60%> | "+fo.permissions)
        end for
        for fl in fls
            print("<size=75%><color=white>"+fl.name+"</color><size=60%> | "+fl.permissions)
        end for
    end for
    print("\n")
end function

rummage = function(rfile)
    if rfile == null then
        rfile = myPC.File("/")
    end if
    while rfile.parent != null
        rfile = rfile.parent
    end while
    comp = false
    while comp != true
        ok = false
        while ok != true
            bnr
            opts = []
            fP = rfile.parent
            if fP != null and rfile.is_folder == 1 then
                opts.push(fP)
            else 
                if fP != null and fP.parent != null then opts.push(fP.parent)
            end if
            if rfile.is_folder == 1 then
                opts = opts+rfile.get_folders+rfile.get_files
            else
                opts = opts+rfile.parent.get_folders+rfile.parent.get_files
            end if
            mCt = opts.len
            print("\nRUMMAGING: "+rfile.path+"\n")
            opts.reverse
            for to in opts
                if to.name == opts[opts.len-1].name and rfile.parent != null then
                    print("<b>"+mCt+"</b>"+":<size=75%> back:</size> "+to.name)
                else
                    print("<b>"+mCt+"</b>"+": "+to.name)
                end if
                mCt=mCt-1
            end for
            opts.reverse
            print("<size=65%>'back': return. 'help': options")
            fileOpt = user_input("\n|:> ")
            if fileOpt == "help" then
                print("<size=85%>wr - write")
                print("<size=85%>ap - append")
                print("<size=85%>cp - copy to ~/kit/resources/temp")
                print("<size=85%>rm - delete")
                print("<size=85%>cat - view + save to ~/kit/resources/catFile")
                print("<size=85%>list")
                user_input("\nBack")
            end if
            if fileOpt == "back" then 
                ok = true
                comp = true
                continue
            end if
            path = rfile
            if fileOpt == "cp" then
                if rfile.is_folder != 1 and not rfile.is_binary then 
                    tFile.set_content(rfile.get_content+"\n"+tFile.get_content)
                    rfile = rfile.parent
                end if
            end if
            if fileOpt == "wr" then
                cont = user_input("Text  |:> ")
                if rfile.is_folder != 1 and not rfile.is_binary then 
                    rfile.set_content(cont)
                    rfile = rfile.parent
                end if
            end if
            if fileOpt == "ap" then
                cont = user_input("Text  |:> ")
                if rfile.is_folder != 1 and not rfile.is_binary then 
                    rfile.set_content(rfile.get_content+"\n"+cont)
                    rfile = rfile.parent
                end if
            end if
            if fileOpt == "rm" then 
                rp = rfile.parent
                rfile.delete
                rfile = rp
            end if
            if fileOpt == "cat" then cat(path)
            if fileOpt == "list" then getFiles(rfile)
            fileOpt = fileOpt.to_int
            if typeof(fileOpt) == "number" and (not fileOpt < 1 or not fileOpt > opts.len) then 
                rfile = opts[(fileOpt-1)]
                ok = true
            end if
        end while
    end while
end function

retrieve = function()
    bnr
    print("2: Open/run")
    print("1: View+save")
    print("<size=65%>'back'")
    opt = user_input("\n|:> ")
    menu = opt
    back(menu)
    if opt != "back" then
        opt = opt.to_int
        path = user_input("\n/Path/to/file  |:> ")
        menu = path
        back(menu)
        path = myPC.File(path)
        if not path then path = myPC.File(path+"/")
        if not path.get_content then 
            retrieve
        else
            if opt == 2 then 
                get_shell.launch(path.path)
            else if opt == 1 then
                cat(path)
            end if
        end if
    end if
end function

roster = function()
    if not uL then uL = myPC.File("/home").get_folders
    chk = false
    while chk != true
        bnr
        print("\n<color=#6467fe>Users")
        print("10: Change password")
        print("9: Change owner")
        print("8: Check users")
        print("7: Add user")
        print("6: Remove user")
        print("\n<color=#6467fe>Groups")
        print("5: Change group")
        print("4: Check groups")
        print("3: Add group")
        print("2: Remove group\n")
        print("1: Back")
        mnopt = user_input("\n|:> ").to_int
        menu = mnopt
        back(menu)
        if mnopt == 1 then
            chk = true
        else if mnopt == 2 then
            unm = user_input("User  |:> ")
            menu = unm
            back(menu)
            gnm = user_input("Group  |:> ")
            menu = gnm
            back(menu)
            myPC.delete_group(unm, gnm)
        else if mnopt == 3 then
            unm = user_input("User  |:> ")
            menu = unm
            back(menu)
            gnm = user_input("Group  |:> ")
            menu = gnm
            back(menu)
            myPC.create_group(unm, gnm)
        else if mnopt == 4 then
            unm = user_input("User  |:> ")
            menu = unm
            back(menu)
            print
            gps = myPC.groups(unm)
            print("\n"+gps)
            user_input("\nBack")
        else if mnopt == 5 then
            chgrp
        else if mnopt == 6 then
            unm = user_input("User  |:> ")
            menu = unm
            back(menu)
            chccheck = false
            while chccheck != true
                print("\nRm /home/"+unm+"?")
                print("\n2: Yes")
                print("1: No")
                chc = user_input("\n|:> ").to_int
                menu = chk
                back(menu)
                if chc == 2 then 
                    home = myPC.File("/home/"+unm)
                    if home then 
                        myPC.delete_user(unm, removeHome)
                    else
                        myPC.delete_user(unm)
                    end if
                    chccheck = true
                else if chc == 1 then
                    myPC.delete_user(unm)
                    chccheck = true
                end if
            end while
        else if mnopt == 7 then
            unm = user_input("User  |:> ")
            menu = unm
            back(menu)
            pass = user_input("Pass  |:> ")
            menu = pass
            back(menu)
            myPC.create_user(unm, pass)  
        else if mnopt == 8 then
            print(uL)
        else if mnopt == 9 then
            chown
        else if mnopt == 10 then
            passf
        end if
    end while
end function

manifest = function(uL, result)
    bnr
    chk = false
    if result == null then
        dir = myPC.File("/home")
    else
        fir = rPC.File("/home")
    end if
    if dir then dirs = dir.get_folders
    if not uL then uL = "Users * "+dirs
    print("<b>2</b>: ROSTER          [<color=#6467fe>users/groups</color>]")
    print("<b>1</b>: BRIG            [<color=#6467fe>permissions</color>]")
    print("<size=65%>'back'")
    opt = user_input("\n|:> ")
    menu = opt
    back(menu)
    if opt == "back" then
    else
        opt = opt.to_int
        if opt == 1 then
            print("\n3: Allow all")
            print("2: Deny all")
            print("1: Manage one")
            opt = user_input("\n|:> ").to_int
            menu = opt
            back(menu)
            if opt == 3 or opt == 2 then
                dir = myPC.File("/")
                if dir then dirs = dir.get_folders
                addPerms(dirs)
            else if opt == 1 then
                path = user_input("\nFull/path  |:> ")
                menu = path
                back(menu)
                print("\n<size=75%>rwx:rwx:rwx:+/- ")
                pO = user_input("\n|:> ")
                menu = pO
                back(menu)
                chk = false
                while chk != true
                    if pO.len != 13 then
                        print("No")
                    else
                        pO = pO.split(":")
                        count = 0
                        for line in pO
                            read = null
                            write = null
                            x = null
                            for order in line
                                if order == "r" and pO[3] == "+" then read = true
                                if order == "r" and pO[3] == "-" then read = false
                                if order == "w" and pO[3] == "+" then write = true
                                if order == "w" and pO[3] == "-" then write = false
                                if order == "x" and pO[3] == "+" then x = true
                                if order == "x" and pO[3] == "-" then x = false
                            end for
                            fil = myPC.File(path)
                            if count == 0 then
                                if read == true then
                                    fil.chmod("u+r")
                                else
                                    fil.chmod("u-r")
                                end if
                                if write == true then
                                    fil.chmod("u+w")
                                else
                                    fil.chmod("u-w")
                                end if
                                if x == true then
                                    fil.chmod("u+x")
                                else
                                    fil.chmod("u-x")
                                end if
                            else if count == 1 then
                                if read == true then
                                    fil.chmod("g+r")
                                else
                                    fil.chmod("g-r")
                                end if
                                if write == true then
                                    fil.chmod("g+w")
                                else
                                    fil.chmod("g-w")
                                end if
                                if x == true then
                                    fil.chmod("g+x")
                                else
                                    fil.chmod("g-x")
                                end if
                            else if count == 2 then
                                if read == true then
                                    fil.chmod("o+r")
                                else
                                    fil.chmod("o-r")
                                end if
                                if write == true then
                                    fil.chmod("o+w")
                                else
                                    fil.chmod("o-w")
                                end if
                                if x == true then
                                    fil.chmod("o+x")
                                else
                                    fil.chmod("o-x")
                                end if
                            end if
                            count = count+1
                            if count == 3 then chk = true
                        end for
                    end if
                end while
            end if
        else if opt == 2 then
            roster
        end if
    end if
end function

mainsail = function()
    bnr
    chk = true
    cryp.airmon("start", "wlan0")
    print("2: Target one")
    print("1: Catch 'em all")
    print("<size=65%>'back'")
    targ = user_input("\n|:> ")
    if targ == "back" then
    else
        targ = targ.to_int
        if targ == 2 then
            nets = myPC.wifi_networks("wlan0")
            info = "BSSID PWR ESSID"
            for net in nets 
                info = info + "\n" + net
            end for
            ifconfig(chk)
            print(format_columns(info))
            bssid = user_input("\n<color=#0066ff>BSSID</color>  \n|:> ")
            menu = bssid
            back(menu)
            essid = user_input("\n<color=#8b35ff>ESSID</color>  \n|:> ")
            menu = essid
            back(menu)
            pwr = user_input("\n<color=#0066ff>PWR</color>  \n|:> ")
            menu = pwr
            back(menu)
            clear_screen
            acks = (floor(300000/pwr.to_int)+1)
            result = cryp.aireplay(bssid,essid,acks)
            if typeof(result) == "string" then print(result)
            password = cryp.aircrack(home_dir + "/" + "file.cap")
            status = myPC.connect_wifi("wlan0",bssid,essid,password)    
            myPC.File(home_dir + "/" + "file.cap").delete
            clear_screen
        else if targ == 1 then
            clear_screen
            for net in myPC.wifi_networks("wlan0")
                power = net.split(" ")[1].remove("%").val
                acks = (floor(300000/power)+1)
                bssid = str(net.split(" ")[0])
                essid = str(net.split(" ")[2])
                result = cryp.aireplay(bssid, essid, acks)
                if typeof(result) == "string" then print(result)
                password = cryp.aircrack(home_dir + "/" + "file.cap")
                myPC.connect_wifi("wlan0",bssid, essid, password)
                if myPC.File(home_dir + "/" + "file.cap") then myPC.File(home_dir + "/" + "file.cap").delete
            end for
        end if
        cryp.airmon("stop", "wlan0")
    end if
end function

dig = function(fchk, rPC)
    bnr
    if rPC != null then myPC = rPC
    if not fchk then
        print("\n2: List")
        print("1: Hash")
        print("<size=65%>'back'")
        opt = user_input("\n|:> ")
        menu = opt
        back(menu)
    else
        opt = "1"
    end if
    if opt != "back" then 
        if opt == "2" then
            pfl = user_input("\nFull/path  |:> ")
            menu = pfl
            back(menu)
            gF = myPC.File(pfl)
        else if opt == "1" then
            print("\n<hash> or <usr:hash>")
            pfl = user_input("\n|:> ")
            menu = pfl
            back(menu)
            sF = pfl
            gF = null
        else
            dig
        end if
        gPs = function(uPs)
            if uPs.len == 1 then Pass = cryp.decipher(uPs[0])
            if uPs.len == 2 then Pass = cryp.decipher(uPs[1])
            return Pass
        end function
        fR = function(psr)
            if Pass then print(psr+"\n")
            pFile = myPC.File(mP+"/pList")
            if Pass and pFile then pFile.set_content(uPs[0]+":"+psr+"\n"+pFile.get_content)
        end function
        if opt == "2" then
            if gF and cF.get_content != null and gF.has_permission("r") then 
                sF = gF.get_content.split("\n")
            else if pfl.len > 33 then
                sF = [pfl]
            end if
            if sF then
                for line in sF
                    uPs = line.split(":")
                    print(uPs)
                    Pass = gPs(uPs)
                    fR(Pass)
                end for
            end if
        else if opt == "1" then
            uPs = sF.split(":")
            print(uPs)
            Pass = gPs(uPs)
            fR(Pass)
        end if
        user_input("\nBack")
    end if
    myPC = get_shell.host_computer
end function

stow = function()
    if active_user != "root" then 
        print("No root\n")
    else
        bnr
        path = user_input("\n/File/path  |:> ")
        menu = path
        back(menu)
        fSp = path.split("/")
        sC = fSp.len
        fN = fSp[sC-1]
        password = user_input("\nPass  |:> ")
        menu = password
        back(menu)
        myPC.touch(mP, fN+".src")
        source = myPC.File(mP+"/"+fN+".src")
        if not source then 
            stow
        else
            fCon = myPC.File(path)
            if not fCon then 
                stow
            else
                contents = "
myPC = get_shell.host_computer
passw = """+password+"""
if params.len != 1 then 
    print(""Magic word?"")
    pass = user_input(""
|:> "", true)
    if pass == passw then 
        print(""2: Read File"")
        print(""1: Unlock File"")
        ok = user_input(""
|:> "")
    end if
    if ok == ""2"" then
        fCon = """+fCon.get_content+"""
        print(""
""+fCon)
    else if ok == ""1"" then
        fCon = """+fCon.get_content+"""
        myPC.touch(current_path, ""temp"")
        myPC.File(current_path+""/temp"").set_content(fCon)
    end if
else if params.len == 1 then
    pass = params[0]
    if pass == passw then fCon = """+fCon.get_content+"""
    myPC.touch(current_path, ""temp"")
    myPC.File(current_path+""/temp"").set_content(fCon)
end if"
            source.set_content(contents)
            get_shell.build(source.path, mP)
            source.delete
            if not fCon.is_binary then fCon.delete
        end if
    end if
end function

wiper = function()
    bnr
    if active_user == "root" then   
        print("\n3: Local")
        print("2: Proxies")
        print("1: Remote")
        print("<size=65%>'back'")
        order = user_input("\n|:>  ")
        menu = order
        back(menu)
        ok = false
        if order == "back" then
        else
            order = order.to_int
            sf = null
            while ok != true
                if order == 3 then  
                    ok = true
                    terminal = myPC.File("/usr/bin/Terminal.exe")
                    sudo = myPC.File("/bin/sudo")  
                    users = null 
                    bnk = get_shell.host_computer.File("/root/Config/Bank.txt")
                    eml = get_shell.host_computer.File("/root/Config/Mail.txt")
                    guest = get_shell.host_computer.File("/home/guest")
                    pass = get_shell.host_computer.File("/etc/passwd")
                    t1 = get_shell.host_computer.File("/root/.Trash")
                    dir = get_shell.host_computer.File("/")
                    dirs = dir.get_folders
                    if sudo then 
                        chk = false
                        while chk != true
                            print("\n<b>New sudo name?\n")
                            print("2: Yes")
                            print("1: No")
                            opt = user_input("\n|:>  ")
                            menu = opt
                            back(menu)
                            if opt == "2" then
                                chk = true
                                nN = user_input("Name  |:> ")
                                menu = nN
                                back(menu)
                                sudo.move("/bin", nN)
                            else if opt == "1" then
                                chk = true
                            else if not opt or opt == "" then
                                chk = true
                            end if
                        end while
                    else
                        chk = false
                        while chk != true
                            sudo = user_input("\nSudo name  |:> ")
                            menu = sudo
                            back(menu)
                            sf = myPC.File("/bin/"+sudo)
                            if sf then
                                chk = true
                            else if sf == null or sf == "" then
                                chk = true
                            end if
                        end while
                    end if  
                    if guest then guest.delete
                    if t1 then t1.delete
                    if bnk then bnk.delete
                    if eml then eml.delete    
                    if pass then pass.delete
                    if get_shell.host_computer.File("/home") then users = get_shell.host_computer.File("/home").get_folders
                    for user in users
                        user = user.name
                        t2 = get_shell.host_computer.File("/home/"+user+"/.Trash")
                        if t2 then t2.delete
                    end for
                    setPerms(dirs)
                    if sf then sf.chmod("g+x")
                    logs.copy("/var", "system.log")
                    wait(1)
                else if order == 2 then
                    ok = true
                    chk = false
                    while chk == false
                        print("\nUpdate libs?")
                        print("2: Yes")
                        print("1: No")
                        upopt = user_input("\n|:>  ") 
                        menu = upopt
                        back(menu)
                        if upopt == 1 or upopt == 2 then chk = true
                    end while
                    spls = null
                    ipList = myPC.File(mP+"/ipList")
                    if ipList then 
                        if not ipList.is_binary then
                            spls = ipList.get_content.split("\n") 
                        else
                            pass = user_input("\nPass  |:> ")
                            menu = pass
                            back(menu)
                            get_shell.launch(mP+"/ipList", pass)
                            tFile = myPC.File(mP+"/temp")
                            if tFile.get_content != null then spls = tFile.get_content.split("\n")
                            tFile.set_content("")
                        end if
                        if spls then
                            for line in spls
                                spLine = line.split(":")
                                if not spLine[0] or not spLine[1] then continue
                                shell = get_shell.connect_service(spLine[1], 22, "root", spLine[0])
                                if not shell then 
                                    print("\nNo @ "+spLine[1]+"\n") 
                                else
                                    print("\nYes @ "+spLine[1]+"\n") 
                                end if
                                if shell then
                                    dir = shell.host_computer.File("/")
                                    if dir then dirs = dir.get_folders
                                    rClean(shell)
                                    setPerms(dirs)
                                    if upopt == 1 then
                                        get_shell.scp("/lib/init.so", "/lib", shell)
                                        get_shell.scp("/lib/net.so", "/lib", shell)
                                        get_shell.scp("/lib/kernel_module.so", "/lib", shell)
                                    end if
                                    get_shell.scp(logs.path, "/var", shell)
                                end if
                            end for
                        end if
                    end if
                else if order == 1 then
                    ok = true
                    rUpd
                end if
            end while
        end if
    else
        print("No root")
    end if
    wait(1)
end function

board = function()
    chk = false
    gomin = false
    gocon = null
    pathx = myPC.File(mP+"/temp")
    while chk == false
        bnr
        print("\n5: Pwned")
        print("4: Proxies")
        print("\n3: Update")
        print("2: Load")
        print("1: Board")
        print("<size=65%>'back'")
        opt = user_input("\n|:> ")
        menu = opt
        back(menu)
        if opt == "back" then
            chk = true
        else
            opt = opt.to_int
            if opt == 5 then
                path = myPC.File(mP+"/pwnList")
                if path.is_binary then
                    pass = user_input("\nPass  |:> ")
                    menu = pass
                    back(menu)
                    get_shell.launch(mP+"/pwnList", pass)
                    if pathx and pathx.get_content and pathx.has_permission("r") then
                        print("\n"+pathx.get_content)
                        pathx.set_content("")
                    end if
                    user_input("\nBack")
                else if path.get_contents != null then
                    print(path.get_contents)
                    user_input("\nBack")
                end if
            else if opt == 4 then
                path = myPC.File(mP+"/ipList")
                if path and path.is_binary then
                    pass = user_input("\nPass  |:> ")
                    menu = pass
                    back(menu)
                    get_shell.launch(mP+"/ipList", pass)
                    if pathx and pathx.get_content and pathx.has_permission("r") then
                        print("\n"+pathx.get_content)
                        pathx.set_content("")
                    end if
                    user_input("\n   Back")
                else if path.get_contents != null then
                    print(path.get_contents)
                    user_input("\n   Back")
                end if
            end if
            if opt == 3 then rUpd
            if opt == 2 then go
            if opt == 1 then 
                gocon = "x"
                go(gocon)
            end if
        end if
    end while
end function

cast = function()
    bnr
    popt = null
    mchk = null
    tMem = null
    tVal = null
    lst = []
    mems = []
    values = []
    results = []
    libnms = []
    libvers = []
    sMem = []
    sVal = []
    Okr = []
    unm = []
    portList = []
    ip = []
    rport = []
    ports = [0]
    rps = null
    users = null
    result = null
    shell = null
    rPC = null
    file = null
    zero = false
    fwa = false
    np = false
    player = false
    plyr = false
    lchc = null
    
    print("2: Local")
    print("1: Remote/LAN")
    rorl = user_input("\n|:> ")
    menu = rorl
    back(menu)
    rorl = rorl.to_int
    if rorl == 1 then
        adr = user_input("\n<color=#0066ff>IP</color>  |:> ")
        menu = adr
        back(menu)
        if not is_valid_ip(adr) then cast
        if is_lan_ip(adr) then
            r = adr
            if typeof(r) != "router" then r = get_router(adr)
            if typeof(r) != "router" then r = get_router
        else if is_valid_ip(adr) then
           r = get_router(adr)
           if typeof(r) != "router" then r = get_router
        else
            cast
        end if
        if not r or typeof(r) != "router" then cast
        psinfo = "0"+" "+r.local_ip+" "+"Router"
        if not is_lan_ip(adr) then
            for p in r.used_ports
                ports = ports+[p.port_number]
                portList = portList+[p.port_number+" "+p.get_lan_ip+" "+r.port_info(p)]
                psinfo = psinfo+"\n"+p.port_number+" "+p.get_lan_ip+" "+r.port_info(p)
            end for
        else
            for p in r.device_ports(adr)
                ports = ports+[p.port_number]
                portList = portList+[p.port_number+" "+p.get_lan_ip+" "+r.port_info(p)]
                psinfo = psinfo+"\n"+p.port_number+" "+p.get_lan_ip+" "+r.port_info(p)
            end for
        end if
        print("\n<color=#6467fe>Port select")
        print(format_columns(psinfo))
        print("\n1: <color=#0066ff>Catch 'em all")
        popt = user_input("\n|:> ")
        menu = popt
        back(menu)
        if popt == "0" then zero = true
        popt = popt.to_int
        if popt != 1 then
            ports = [popt]
            popt = 2
        else
            popt = 1
        end if
    end if
    lpath = []
    if rorl == 2 then
        ror = false
        while ror != true 
            libfs = myPC.File("/lib").get_files
            libf = "\n<color=#6467fe>Libs"
            for fl in libfs
                libf = libf+"\n<color=#0066ff>"+fl.name+"</color>"
            end for
            print(libf)
            print("\n2: Target one")
            print("1: Catch 'em all")
            lchc = user_input("\n|:> ")
            if lchc == "2" then
                libfnd = user_input("\nFile path  |:> ")
                menu = libfnd
                back(menu)
                lpath = [myPC.File(libfnd)]
                if lpath then ror = true
            else if lchc == "1" then
                for fl in libfs
                    lpath = lpath+[fl]
                end for
                ror = true
            end if
        end while
    end if
    if (rorl == 2 and lchc == "2") or popt == 2 then
        inpOpt = false
        while inpOpt != true
            print("\n<color=#0066ff>Target specific vulnerability?")
            print("\n2: Yes")
            print("1: No")
            mchk = user_input("\n|:> ").to_int
            menu = mchk
            back(menu)
            if mchk == 2 then 
                print("\nMemory")
                tMem = user_input("|:> ")
                menu = tMem
                back(menu)
                print("\nValue")
                tVal = user_input("|:> ")
                menu = tVal
                back(menu)
                inpOpt = true
            else if mchk == 1 then 
                inpOpt = true
            end if
        end while
    end if
    if popt == 1 or lchc == "1" then mchk = 1
    if rorl == 1 then
        if popt == 0 or popt == 8080 or popt == 1 or zero == true then
            print("\n<size=85%><color=#6467fe>IPs</color>")
            ipls = r.devices_lan_ip
            for adrs in ipls
                print("<size=75%>"+adrs)
            end for
            ok = false
            while ok != true
                print("\n<color=#0066ff>Input LAN IP</color> for router attack")
                print("1: skip")
                opt1 = user_input("\n|:> ")
                menu = opt1
                back(menu)
                if opt1 != "1" then
                    ok = true
                    oA = opt1
                else
                    ok = true
                end if
            end while
        end if 
    end if
    bnr
    if rorl == 2 then ports = lpath
    for p in ports
        mLib = null
        memory = null
        if rorl == 1 then
            port = p
            print("<b><color=#6467fe>CAST</color>: "+port+" @ "+adr+"\n")
            pip = r.public_ip
            nchk = mx.net_use(adr, port)
            if not nchk then nchk = mx.net_use(r(adr), port)
            if not nchk then nchk = mx.net_use(pip, port)
            if not nchk then continue
            mLib = nchk.dump_lib
            memory = mx.scan(mLib)
        else if rorl == 2 then
            print("<b>Local <color=#6467fe>CAST\n")
            mLib = mx.load(p.path)
            memory = mx.scan(mLib)
            port = "local"
        end if
        for mem in memory
            print("\n<b><color=#6467fe>New mem")
            if tVal == null then 
                vs = mx.scan_address(mLib, mem).split("Unsafe check: ")    
            else
                vs = tVal
            end if
            for v in vs
                if v == vs[0] then continue
                if mchk == 2 then 
                    iV = tVal
                    mem = tMem
                else if mchk == 1 then 
                    v = v.replace("\n", " ").replace("  ", " ")
                    iV = v[v.indexOf("<b>")+3:v.indexOf("</b>")]
                    v = v.remove("Buffer overflow.").remove("string copy in ").remove("loop in array ").remove(".")
                    v = v.remove("<b>").remove("</b>").remove("<b>").remove("</b>").remove("<b>").remove("</b>")
                end if
                if rorl == 1 then
                    if port == 0 or port == 8080 then
                        oA = opt1
                    else 
                        oA = "abc"
                    end if
                    result = mLib.overflow(mem, iV, oA)
                else
                    oA = "abc"
                    result = mLib.overflow(mem, iV)
                end if
                if not result then 
                    result = "-"
                    v = v.remove(iV)
                    if rorl == 1 then rF2.set_content(adr+":"+port+":"+mem+":"+iV+"\n"+v+"\n"+rF2.get_content)
                end if
                if typeof(result) == "number" then 
                    if rorl == 1 then
                        if port == 0 or port == 8080 then 
                            result = "fw-yes"
                            fwa = true
                        else
                            result = "Newpass:'abc'" 
                            np = true
                        end if
                        if rorl == 1 then rF1.set_content(result+":"+adr+":"+port+":"+mem+":"+iV+"\n"+v+"\n"+rF1.get_content) 
                    end if
                end if
                print("\n--=[")
                print("<size=85%><b><color=#e93855>"+result)
                print("<b><size=85%><color=white>"+mem)
                print("<b><size=85%><color=orange>"+iV)
                print("]=--\n")
                mems = mems+[mem]
                values = values+[iV]
                results = results+[result]
                libnms = libnms+[mLib.lib_name]
                libvers = libvers+[mLib.version]
                v = v.remove(iV) 
                if result then
                    rchk = false
                    pchck = false
                    hchk = false
                    bchk = false
                    gchk = false
                    okg = false
                    nxt = false
                    if typeof(result) == "shell" or typeof(result) == "computer" then
                        if typeof(result) == "shell" then 
                            shell = result
                            rPC = result.host_computer
                            file = result.host_computer.File("/")
                        else
                            rPC = result
                            file = result.File("/")
                        end if
                        home = rPC.File("/home")
                        pfl = rPC.File("/etc/passwd")
                        if home then users = home.get_folders 
                        if pfl and not rps then
                            if pfl != null and pfl.get_content and pfl.has_permission("r") then
                                pls = pfl.get_content.split("\n")
                                rHash = pls[0].split(":")
                                rps = cryp.decipher(rHash[1])
                                pfil = myPC.File(mP+"/pass")
                                pfil.set_content(pfl.get_content+"\n"+pfil.get_content)
                                psave = myPC.File(mP+"/pList")
                                psave.set_content(rHash[0]+":"+rps+"\n"+psave.get_content)
                            end if
                        end if
                        for user in users
                            mail = rPC.File("/home/" + user.name + "/Config/Mail.txt")
                            if mail != null and mail.get_content then
                                if eml then eml.set_content(mail.get_content+"\n"+eml.get_content)
                            end if
                            bank = rPC.File("/home/" + user.name + "/Config/Bank.txt")
                            if bank != null and bank.get_content then
                                if bnk then bnk.set_content(bank.get_content+"\n"+bnk.get_content)
                            else
                                continue
                            end if
                        end for 
                        if users then
                            for user in users
                                if user.name == "guest" then continue
                                no = false
                                for ls in lst
                                    if ls == user.name then no = true
                                end for
                                if not no then lst = lst+[user.name] 
                            end for
                        end if
                        lFile = rPC.File("/var/system.log")
                        if (lFile and lFile.has_permission("w")) or (rPC.File("/root") and rPC.File("/root").has_permission("w")) then
                            name="Root"
                            unm = unm+["Root"]
                            Okr = Okr+[result]
                            ip = ip+[rPC.local_ip]
                            rport = rport+[port]
                            sMem = sMem+[mem]
                            sVal = sVal+[iV]
                            rchk = true
                        end if
                        if users then
                            for user in users
                                if not rchk then
                                    if rPC.File("/home/"+user.name+"/Desktop").get_files == true then
                                        name="Player"
                                        unm = unm+["Player"]
                                        Okr = Okr+[result]
                                        ip = ip+[rPC.local_ip]
                                        rport = rport+[port]
                                        sMem = sMem+[mem]
                                        sVal = sVal+[iV]
                                        player = true
                                        nxt = true
                                    else if user.name != "guest" and rPC.File("/home/"+user.name) and rPC.File("/home/"+user.name).has_permission("w") then
                                        name= user.name
                                        unm = unm+[user.name]
                                        Okr = Okr+[result]
                                        ip = ip+[rPC.local_ip]
                                        rport = rport+[port]
                                        sMem = sMem+[mem]
                                        sVal = sVal+[iV]
                                        nxt = true
                                    end if
                                else
                                    continue
                                end if
                            end for
                            if not nxt and not rchk and (pfl and not pfl.has_permission("r")) then
                                name="Guest"
                                unm = unm+["Guest"]
                                Okr = Okr+[result]
                                ip = ip+[rPC.local_ip]
                                rport = rport+[port]
                                sMem = sMem+[mem]
                                sVal = sVal+[iV]
                                gchk = true
                            end if
                            if not nxt and not gchk and not rchk and rPC.File("/bin") and (not rPC.File("/bin").has_permission("w")) then
                                name="Guest"
                                unm = unm+["Guest"]
                                Okr = Okr+[result]
                                ip = ip+[rPC.local_ip]
                                rport = rport+[port]
                                sMem = sMem+[mem]
                                sVal = sVal+[iV]
                                okg = true
                            end if
                            if not nxt and not gchk and not rchk and not okg then
                                name="Proxy"
                                unm = unm+["Proxy"]
                                Okr = Okr+[result]
                                ip = ip+[rPC.local_ip]
                                rport = rport+[port]
                                sMem = sMem+[mem]
                                sVal = sVal+[iV]
                            end if
                        else if not rchk then
                            name="Proxy"
                            unm = unm+["Proxy"]
                            Okr = Okr+[result]
                            ip = ip+[rPC.local_ip]
                            rport = rport+[port]
                            sMem = sMem+[mem]
                            sVal = sVal+[iV]
                            nxt = true
                            plyr = true
                        end if
                        reschk = false
                        for Res in sRes     
                            if result == sRes then 
                                for iP in sIP
                                    if rPC.local_ip == sIP then
                                        for Unm in sUnm
                                            if sUnm == hfol.name then 
                                                reschk = true
                                                continue
                                            end if
                                        end for
                                    else
                                        continue
                                    end if
                                end for
                            else
                                continue
                            end if
                        end for
                        if reschk != true then
                            sUnm = sUnm+[name]
                            sRes = sRes+[result]
                            sIP = sIP+[rPC.local_ip]
                            pIP = pIP+[rPC.public_ip]
                            sport = sport+[port]
                            saMem = saMem+[mem]
                            saVal = saVal+[iV]
                            reschk = false 
                            resFile = myPC.File(mP+"/results")
                            if resFile.get_content != null then resLines = resFile.get_content.split("\n")
                            okln = false
                            if resLines != null then
                                for line in resLines
                                    if line == name+":"+typeof(result)+":"+rPC.public_ip+":"+rPC.local_ip+":"+port+":"+str(mLib.lib_name)+":"+str(mLib.version)+":"+mem+":"+iV then okln = true
                                end for
                                if okln != true then resFile = resFile.set_content(name+":"+typeof(result)+":"+rPC.public_ip+":"+rPC.local_ip+":"+port+":"+str(mLib.lib_name)+":"+str(mLib.version)+":"+mem+":"+iV+"\n"+resFile.get_content)
                            end if
                        end if  
                    else if typeof(result) == "file" then
                        file = result
                        while file.parent != null
                            file = file.parent
                        end while
                        if file.get_folders then fl = file.get_folders
                        if not rps then
                            for dir in fl
                                if dir.name == "etc" then
                                    files = dir.get_files
                                    for tf in files
                                        if tf.name == "passwd" and tf.has_permission("r") then
                                            if tf.get_content then
                                                pls = tf.get_content.split("\n")
                                                rHash = pls[0].split(":")
                                                rps = cryp.decipher(rHash[1])
                                                psave = myPC.File(mP+"/pass")
                                                psave.set_content(tf.get_content+"\n"+psave.get_content)
                                                psFile = myPC.File(mP+"/pList")
                                                psFile.set_content(rHash[0]+":"+rps+"\n"+psFile.get_content)
                                            end if
                                        else
                                            continue
                                        end if
                                    end for
                                else
                                    continue
                                end if
                            end for
                        end if
                        okd = null
                        if rorl == 1 then
                            pts = r.device_ports(r.local_ip)
                            okd2 = r.public_ip
                            if port == 0 or port == 8080 then
                                if rPC != null then okd = rPC.local_ip
                                if okd == null and typeof(result) != "computer" then 
                                    okd = r.local_ip
                                else if okd == null and typeof(result) == "computer" then
                                    if opt1 != "abc" then okd = opt1
                                end if
                            else
                                for pt in pts
                                    if pt.port_number == port and adr == pt.get_lan_ip then okd = pt.get_lan_ip
                                end for
                                if okd == null and rPC != null then okd = rPC.local_ip
                                if okd == null then
                                    for p in pts
                                        if port == p then okd = p.get_lan_ip
                                    end for
                                end if
                                if okd == null then okd = "Unknown"
                            end if
                        else if rorl == 2 then
                            okd = myPC.local_ip
                        end if
                        fl = file.get_folders
                        pf = null
                        for fold in fl
                            if fold.name == "etc" then
                                fils = fold.get_files
                                for fil in fils
                                    if fil.name == "passwd" then
                                        pf = fil
                                        if fil and fil.has_permission("w") then
                                            name = "Root"
                                            unm = unm+["Root"]
                                            Okr = Okr+[result]
                                            ip = ip+[okd]
                                            rport = rport+[port]
                                            sMem = sMem+[mem]
                                            sVal = sVal+[iV]
                                            pchck = true
                                        else
                                            continue
                                        end if
                                    else
                                        continue
                                    end if
                                end for
                            else
                                continue
                            end if
                        end for
                        for fold in fl
                            if fold.name == "home" then
                                hf = fold.get_folders
                                for hfol in hf
                                    if lst == [] then lst = lst+[hfol.name]
                                    if hfol.name != "guest" and not pchck then
                                        if hfol and hfol.has_permission("w") then
                                            name = hfol.name
                                            unm = unm+[hfol.name]
                                            Okr = Okr+[result]
                                            ip = ip+[okd]
                                            rport = rport+[port]
                                            sMem = sMem+[mem]
                                            sVal = sVal+[iV]
                                            hchk = true
                                        end if
                                    end if
                                    userhm = hfol.get_folders
                                    for hmfol in userhm
                                        if hmfol.name == "Config" then
                                            conf = hmfol.get_files
                                            for itm in conf
                                                if itm and itm.name == "Mail.txt" and itm.has_permission("r") then
                                                    eml.set_content(itm.get_content+"\n"+eml.get_content)
                                                else if itm and itm.name == "Bank.txt" and itm.has_permission("r") then
                                                    bnk.set_content(itm.get_content+"\n"+bnk.get_content)
                                                else
                                                    continue
                                                end if
                                            end for
                                        else
                                            continue
                                        end if
                                    end for
                                end for
                            else
                                continue
                            end if
                        end for
                        if not pchck and not hchk then
                            for fold in fl
                                if fold.name == "bin" then
                                    if fold and (not fold.has_permission("w") or not pf.has_permission("r")) then
                                        name="Guest"
                                        unm = unm+["Guest"]
                                        Okr = Okr+[result]
                                        ip = ip+[okd]
                                        rport = rport+[port]
                                        sMem = sMem+[mem]
                                        sVal = sVal+[iV]
                                        bchk = true
                                    end if
                                else
                                    continue
                                end if
                            end for
                        end if
                        if not pchck and not hchk and not bchk then
                            name="Proxy"
                            unm = unm+["Proxy"]
                            Okr = Okr+[result]
                            ip = ip+[okd]
                            rport = rport+[port]
                            sMem = sMem+[mem]
                            sVal = sVal+[iV]
                            plyr = true
                        end if    
                        reschk = false
                        for Res in sRes     
                            if result == sRes then 
                                for iP in sIP
                                    if okd == sIP then
                                        for Unm in sUnm
                                            if sUnm == name then 
                                                reschk = true
                                                continue
                                            end if
                                        end for
                                    else
                                        continue
                                    end if
                                end for
                            else
                                continue
                            end if
                        end for
                        if reschk != true then
                            sUnm = sUnm+[name]
                            sRes = sRes+[result]
                            sIP = sIP+[okd]
                            pIP = pIP+[okd2]
                            sport = sport+[port]
                            saMem = saMem+[mem]
                            saVal = saVal+[iV]
                            reschk = false 
                            resFile = myPC.File(mP+"/results")
                            if resFile.get_content != null then resLines = resFile.get_content.split("\n")
                            okln = false
                            if resLines != null then 
                                for line in resLines
                                    if line == name+":"+typeof(result)+":"+okd2+":"+okd+":"+port+":"+str(mLib.lib_name)+":"+str(mLib.version)+":"+mem+":"+iV then okln = true
                                end for
                                if okln != true then resFile = resFile.set_content(name+":"+typeof(result)+":"+okd2+":"+okd+":"+port+":"+str(mLib.lib_name)+":"+str(mLib.version)+":"+mem+":"+iV+"\n"+resFile.get_content)
                            end if
                        end if  
                    end if
                    ppl = "Users: "
                    if lst != [] then
                        for pe in lst
                            ppl = ppl+" "+pe
                        end for
                    end if
                    sps = null
                    if rps then sps = rps+":"
                    if rorl == 1 then rF1.set_content(name+":"+typeof(result)+":"+sps+adr+":root:"+port+":"+":"+mem+":"+iV+"\n"+ppl+"\n"+v+"\n"+rF1.get_content) 
                else
                    continue
                end if
            end for
        end for
    end for

    gosh = null
    if rps != null and rorl == 1 then
        for p in ports
            if gosh == null then
                goport = p
                gosh = get_shell.connect_service(r.public_ip, goport, "root", rps)
                if typeof(gosh) == "shell" then ftpok = false
            else
                continue
            end if
        end for
        for p in ports
            if gosh == null then
                goport = p
                if gosh == null then gosh = get_shell.connect_service(r.public_ip, goport, "root", rps, "ftp")
                if typeof(gosh) == "ftpshell" then ftpok = true  
            else
                continue
            end if
        end for
    end if
    
    ptlist = "Port(s) * "
    if rorl == 1 then
        for p in ports
            ptlist = ptlist+p+" "
        end for
        if rps then shells.set_content(rps+":"+adr+":root:"+port+"\n"+shells.get_content)
        uL = null
        if lst == [] then
            if r == get_router(adr) then lst = [cryp.smtp_user_list(r.public_ip, port)]
        end if
        if typeof(lst) != "list" or lst == [] then
            if r == get_router(adr) then lst = [cryp.smtp_user_list(r.public_ip, port)]
        end if    
        if typeof(lst) != "list" or lst == [] then
            uL = "No users"
        else
            uL = "<color=#0066ff>Users</color> * "
            for user in lst
                uL = uL+" "+user
            end for
        end if
    else
        uL = "No users"
    end if
    
    oldl = null
    count = 0
    vulninfo = "* MEMORY VALUE RESULT\n"
    for result in results
        if count == 0 then 
            vulninfo = vulninfo+" "+mems[count]+" "+values[count]+" "+results[count]
        else if oldl == libnms[count] and count != 0 then
            vulninfo = vulninfo+"\n"+" "+mems[count]+" "+values[count]+" "+results[count]
        else
            vulninfo = "\n"+vulninfo+"\n \n"+" "+libnms[count]+" "+libvers[count]+" "+"\n \n"+" "+mems[count]+" "+values[count]+" "+results[count]
        end if
        oldl = libnms[count]
        count = count+1
    end for  
    if vulninfo then print(format_columns(vulninfo)+"\n")
    
    rInfo = ""
    mCount=Okr.len
    okCount=Okr.len
    rCount = 0
    if Okr.len != 0 then
        for result in Okr
            rInfo = rInfo+mCount+":"+" "+typeof(result)+" "+unm[rCount]+" "+ip[rCount]+" "+rport[rCount]+" "+sMem[rCount]+" "+sVal[rCount]+"\n"
            rCount = rCount+1
            mCount = mCount-1
        end for
        Okr.reverse
        unm.reverse
        ip.reverse
        rport.reverse
    end if

    gomenu = function(gosh)
        endchk = false
        while endchk != true
            result = gosh
            shell = result
            rPC = result.host_computer
            file = result.host_computer.File("/")
            rfile = file
            adr = result.host_computer.local_ip
            port = goport
            name = "Root"
            okrmt = "go"
            bnr(result)
            print("\nRoot at <size=75%>"+rPC.local_ip+"\n")
            print("5: Users/groups")
            print("4: Board")
            print("3: Loade")
            print("2: Dig")
            print("1: Rummage")
            print("\n<size=85%>'back'")
            optb = user_input("\n|:> ")
            menu = optb
            back(menu)
            if optb == "back" then 
                bnr
                okrmt = false
                endchk = true
            end if
            optb = optb.to_int
            if optb == 5 then manifest(uL, result)
            if optb == 4 then shell.start_terminal
            if optb == 3 then loader(shell)
            if optb == 2 then dig(rPC)
            if optb == 1 then rummage(rfile)
        end while
    end function

    xchk = false
    while xchk != true
        if gosh != null and (not ftpok or ftpok == null) then 
            print("<color=#0066ff>SSH</color> upgrade: "+r.public_ip)
        else if gosh != null and ftpok != null then
            print("<color=#0066ff>FTP</color> upgrade: "+r.public_ip)
        end if
        print("\n<color=#0066ff>IP</color> * "+adr)
        print(ptlist)
        if uL then print(uL)
        if fwa == true then print("Firewall <color=#e93855>down")
        if np == true then print("Newpass: '<color=#e93855>abc</color>'")
        if rps then print("Rootpass: '<color=#e93855>"+rps+"</color>'")
        infoTitle = "\n* RESULT USER ADDRESS PORT MEMORY VALUE"
        if rInfo == null or rInfo == "" then 
            print("\nNo results\n")
        else
            print("\n<b><color=#6467fe>Results")
            print(format_columns(infoTitle+"\n"+rInfo))
        end if
        print("<b>0</b>: <color=#6467fe>main menu</color>. #: <color=#0066ff>result\n")
        opta = user_input("|:> ").to_int
        if typeof(opta) == "number" and (opta+1 > 0) or (opta < okCount+1) and opta != null and opta != "" then
            if opta == 0 then mm
            if typeof(Okr[opta-1]) == "shell" or typeof(Okr[opta-1]) == "ftpshell" then
                if typeof(Okr[opta-1]) == "ftpshell" then ftpok = true
                endchk = false
                while endchk != true
                    result = Okr[opta-1]
                    adr = ip[opta-1]
                    port = rport[opta-1]
                    name = unm[opta-1]
                    shell = result
                    rPC = result.host_computer
                    file = result.host_computer.File("/")
                    rfile = file
                    okrmt = "go"
                    bnr(result)
                    print(unm[opta-1]+" shell at <size=75%>"+ip[opta-1])
                    if rps then print("Root: <color=#e93855>"+rps)
                    if gosh then print("<size=85%>up: root "+typeof(gosh)+":"+goport)
                    print("\n5: Users/groups")
                    print("4: Board")
                    print("3: Load")
                    print("2: Dig")
                    print("1: Rummage")
                    print("\n<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    if optb == "up" then gomenu(gosh)
                    optb = optb.to_int
                    if optb == 5 then manifest(uL, result)
                    if optb == 4 then shell.start_terminal
                    if optb == 3 then loader(shell)
                    if optb == 2 then dig(rPC)
                    if optb == 1 then rummage(rfile)
                end while
            else if typeof(Okr[opta-1]) == "computer" then
                endchk = false
                while endchk != true
                    shell = null
                    result = Okr[opta-1]
                    adr = ip[opta-1]
                    port = rport[opta-1]
                    name = unm[opta-1]
                    rPC = result
                    file = result.File("/")
                    rfile = file
                    okrmt = "go"
                    bnr(result)
                    print(unm[opta-1]+" PC at <size=75%>"+ip[opta-1])
                    if gosh then print("<size=85%>up: root "+typeof(gosh)+":"+goport)
                    print("\n4: Users/groups")
                    print("3: Clear log")
                    print("2: Dig")
                    print("1: Rummage")
                    print("<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    if optb == "up" then gomenu(gosh)
                    optb = optb.to_int
                    if optb == 4 then manifest(uL, result)
                    if optb == 3 then
                        lFile = rPC.File("/var/system.log")
                        if lFile and lFile.has_permission("w") or name == "Root" then 
                            rPC.touch("/var", "new")
                            lfl = rPC.File("/var/new")
                            lfl.move("/var", "system.log")
                        end if
                    end if
                    if optb == 2 then dig(rPC)
                    if optb == 1 then rummage(rfile)
                end while
            else if typeof(Okr[opta-1]) == "file" then
                endchk = false
                while endchk != true
                    result = Okr[opta-1]
                    shell = null
                    rPC = null
                    adr = ip[opta-1]
                    port = rport[opta-1]
                    name = unm[opta-1]
                    file = result
                    rfile = file
                    fchk = true
                    okrmt = "go"
                    bnr(result)
                    print("\n"+unm[opta-1]+" file at <size=75%>"+ip[opta-1])
                    if gosh then print("<size=85%>up: root "+typeof(gosh)+":"+goport)
                    print("\n3: Clear log")
                    print("2: Dig")
                    print("1: Rummage")
                    print("<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    if optb == "up" then gomenu(gosh)
                    optb = optb.to_int
                    if optb == 3 then
                        vP = null
                        pmok = false
                        while file.parent != null
                            file = file.parent
                        end while
                        dirs = file.get_folders
                        for fol in dirs
                            if fol.name == "var" then vP = fol.path
                            varfils = fol.get_files
                            for fil in varfils
                                if fil.name == "system.log" and fil.has_permission("w") or name == "Root" then pmok = true
                            end for
                        end for
                        for fol in dirs
                            if fol.name == "etc" then
                                fils = fol.get_files
                                for fil in fils
                                    if fil.name == "fstab" and pmok == true then fil.copy(vP, "system.log")
                                end for
                            end if
                        end for
                    end if
                    if optb == 2 then dig(fchk)
                    if optb == 1 then rummage(rfile)
                end while
            end if
        end if
    end while
end function

sResults = function()
    sInfo = "\n* RESULT USER PUBLIC LOCAL PORT MEMORY ADDRESS"
    sCount = sRes.len
    sokCount = sRes.len
    srCount = 0
    srInfo = ""
    ychk = false
    result = null
    shell = null
    rPC = null
    file = null
    uL = null
    name = null
    for res in sRes
        srInfo = srInfo+sCount+":"+" "+typeof(sRes[srCount])+" "+sUnm[srCount]+" "+pIP[srCount]+" "+sIP[srCount]+" "+sport[srCount]+" "+saMem[srCount]+" "+saVal[srCount]+"\n"
        srCount = srCount+1
        sCount = sCount-1
    end for
    sRes.reverse
    sUnm.reverse
    sIP.reverse
    pIP.reverse
    sport.reverse
    while ychk != true
        result = false
        bnr
        if srInfo == "" then 
            print("\nNo results\n")
        else
            print("\n<b><color=#6467fe>Playbook")
            print(format_columns(sInfo+"\n"+srInfo))
        end if
        print("<b>0</b>: menu. <size=75%>#: result\n")
        opta = user_input("|:> ").to_int
        if (opta+1 > 1 or opta < sokCount+1) then
            if opta == 0 then mm
            if typeof(sRes[opta-1]) == "shell" or typeof(sRes[opta-1]) == "ftpshell" then
                if typeof(sRes[opta-1]) == "ftpshell" then ftpok = true
                endchk = false
                while endchk != true
                    result = sRes[opta-1]
                    adr = sIP[opta-1]
                    port = sport[opta-1]
                    name = sUnm[opta-1]
                    shell = result
                    rPC = result.host_computer
                    file = result.host_computer.File("/")
                    rfile = file
                    okrmt = "go"
                    bnr(result)
                    print("\n"+sUnm[opta-1]+" file at <size=75%>"+pIP[opta-1]+" -=[ local: "+sIP[opta-1]+"\n")
                    print("\n5: Users/groups")
                    print("4: Board")
                    print("3: Load")
                    print("2: Dig")
                    print("1: Rummage")
                    print("\n<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    optb = optb.to_int
                    if optb == 5 then manifest(uL, result)
                    if optb == 4 then shell.start_terminal
                    if optb == 3 then loader(shell)
                    if optb == 2 then dig(rPC)
                    if optb == 1 then rummage(rfile)
                end while
            else if typeof(sRes[opta-1]) == "computer" then
                endchk = false
                while endchk != true
                    shell = null
                    result = sRes[opta-1]
                    adr = sIP[opta-1]
                    port = sport[opta-1]
                    name = sUnm[opta-1]
                    rPC = result
                    file = result.File("/")
                    rfile = file
                    okrmt = "go"
                    bnr(result)
                    print("\n"+sUnm[opta-1]+" file at <size=75%>"+pIP[opta-1]+" -=[ local: "+sIP[opta-1]+"\n")
                    print("\n4: Users/groups")
                    print("3: Clear log")
                    print("2: Dig")
                    print("1: Rummage")
                    print("<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    optb = optb.to_int
                    if optb == 4 then manifest(uL, result)
                    if optb == 3 then
                        lFile = rPC.File("/var/system.log")
                        if lFile and lFile.has_permission("w") or name == "Root" then 
                            rPC.touch("/var", "new")
                            lfl = rPC.File("/var/new")
                            lfl.move("/var", "system.log")
                        end if
                    end if
                    if optb == 2 then dig(rPC)
                    if optb == 1 then rummage(rfile)
                end while
            else if typeof(sRes[opta-1]) == "file" then
                endchk = false
                while endchk != true
                    shell = null
                    rPC = null
                    result = sRes[opta-1]
                    adr = sIP[opta-1]
                    port = sport[opta-1]
                    name = sUnm[opta-1]
                    file = result
                    rfile = file
                    fchk = true
                    okrmt = "go"
                    bnr(result)
                    print("\n"+sUnm[opta-1]+" file at <size=75%>"+pIP[opta-1]+" -=[ local: "+sIP[opta-1]+"\n")
                    print("\n3: Clear log")
                    print("2: Dig")
                    print("1: Rummage")
                    print("<size=85%>'back'")
                    optb = user_input("\n|:> ")
                    menu = optb
                    back(menu)
                    if optb == "back" then 
                        bnr
                        okrmt = false
                        endchk = true
                    end if
                    optb = optb.to_int
                    if optb == 3 then
                        vP = null
                        pmok = false
                        while file.parent != null
                            file = file.parent
                        end while
                        dirs = file.get_folders
                        for fol in dirs
                            if fol.name == "var" then vP = fol.path
                            varfils = fol.get_files
                            for fil in varfils
                                if fil.name == "system.log" and fil.has_permission("w") or name == "Root" then pmok = true
                            end for
                        end for
                        for fol in dirs
                            if fol.name == "etc" then
                                fils = fol.get_files
                                for fil in fils
                                    if fil.name == "fstab" and pmok == true then fil.copy(vP, "system.log")
                                end for
                            end if
                        end for
                    end if
                    if optb == 2 then dig(fchk)
                    if optb == 1 then rummage(rfile)
                end while
            end if
        end if
        sRes.reverse
        sUnm.reverse
        sIP.reverse
        pIP.reverse
        sport.reverse
    end while
end function

spyglass = function()
    bnr
    fwinfo = "| ACTION PORT SOURCE DESTINATION"
    mapInfo = "| FROM TO PORT STATE SERVICE\n";
    info = "| PORT STATE SERVICE VERSION SOURCE\n"  
    adr = user_input("\n<color=#0066ff>IP</color>  |:> ") 
    menu = adr
    back(menu)
    if not is_valid_ip(adr) then spyglass
    if not myPC.is_network_active then spyglass
    if is_lan_ip(adr) then
        r = adr
        if typeof(r) != "router" then r = get_router(adr)
        if typeof(r) != "router" then r = get_router
    else 
        r = get_router(adr)
        if typeof(r) != "router" then r = get_router
    end if
    if not r or typeof(r) != "router" then spyglass
    ports = null
    if not is_lan_ip(adr) then
       ports = r.device_ports
    else
       ports = r.device_ports(adr)
    end if
    if not ports then ports = r.device_ports(r.local_ip)
    if typeof(ports) == "string" then spyglass
    print("\nWHOIS:  "+adr+whois(r.public_ip))
    if not is_lan_ip(adr) then
        print(get_router(adr).public_ip)
        print(get_router(adr).local_ip)
        print(get_router(adr).essid_name)
        print(get_router(adr).bssid_name+"\n")
    end if
    print("\nRouter kernel: "+r.kernel_version+"\n")
    firewall_rules = r.firewall_rules
    if typeof(firewall_rules) == "string" then print(firewall_rules)
    if firewall_rules.len != 0 then
        for rule in firewall_rules
            fwinfo = fwinfo+"\n"+" "+rule
        end for  
        print(format_columns(fwinfo+"\n"))
    end if
    if typeof(ports) != "string" then 
        for port in ports
            si = r.port_info(port)
            lan_ips = port.get_lan_ip
            ps = "Open"        
            if(port.is_closed) then ps = "Closed"
            info = info+"\n"+" "+port.port_number+" "+ps+" "+si+" "+lan_ips
        end for
    end if
    print("<color=#6467fe>   Target\n")
    print(format_columns(info) + "\n")
    print("<color=#6467fe>   Devices\n")
    pd = null
    nf = "\n"
    devices = r.devices_lan_ip
    for device in devices
        ports = r.device_ports(device)
        ptchk = []
        if typeof(ports) != "string" then 
            for port in ports
                ptchk = ptchk+[port.port_number]
                fwd = null
                portState = "Open";
                if port.is_closed then portState = "Closed"
                if device != port.get_lan_ip then
                    if not devices[0] and device != pd then
                        mapInfo = mapInfo + "\n" + " " + device + " " + port.get_lan_ip + " " + port.port_number + " " + portState + " " + r.port_info(port).split(" ")[0] + "\n"
                    else
                        mapInfo = mapInfo + " " + device + " " + port.get_lan_ip + " " + port.port_number + " " + portState + " " + r.port_info(port).split(" ")[0] + "\n"
                    end if
                    pd = device
                else
                    if not devices[0] and device != pd then
                        nf = nf + "\n" + " " + device + " " + port.get_lan_ip + " " + port.port_number + " " + portState + " " + r.port_info(port).split(" ")[0] + "\n"
                    else
                        nf = nf + " " + device + " " + port.get_lan_ip + " " + port.port_number + " " + portState + " " + r.port_info(port).split(" ")[0] + "\n"
                    end if
                    pd = device
                end if
            end for
        end if
        if ptchk == [] then ptchk = "[No ports]"
        isr = get_router(device)
        iss = get_switch(device)
        if iss then
            print("<color=blue>   Switch</color>: " + device+" "+ptchk)
        else if isr then
            print("<color=white>   Router</color>: " + device+" "+ptchk)
        else
            print("<color=green>   Device</color>: " + device+" "+ptchk)
        end if       
    end for
    print("\n<color=#6467fe>   Frwding\n")
    print(format_columns(mapInfo+nf))
    chk = user_input("\n   Back\n")
    menu = chk
    back(menu)
end function
mm
