<!DOCTYPE html>
<html>

<head>
    <title>CHESCO ACCOUNTS</title>
</head>

<body>
    <center><img src="logo.jpeg"></center>
    <br>
    <br>
    <br>

    <center>
        <p class="login-box-msg" style="color: white;margin-top: -30px"><b></b></p>
    </center>
    <style>


body{
    background:url('./background-2.jpg');
    background-size: cover;
    padding: 6rem;
    margin: 1rem;

}

p{
    color: black !important;
}


img{

    border-left: 6px solid black;
    border-top: 6px solid black;
    border-right: 6px solid #4CAF50;
    border-bottom: 6px solid #4CAF50;
    width:200px; 
    height:200px;
}

#agh {
text-align: center;
    margin-top: 2rem;
    margin: 2rem;
  

 
}

#agh p {
    display: BLOCK;
}

        .block {

            width: 150px;
            border: 2px;
            background-color: #4CAF50;
            color: white;
            padding: 14px 28px;
            margin-bottom: 8px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
        }

        .block:hover {
            background-color: #ddd;
            color: black;
        }

        form .login{
            width: 20rem;
            height: 2rem;
        }
    </style>

    <center>
        <div id='calc-contain'>

            <form name="calculator" action="login.php" method="post">

                <input class="login" type="password" name="password" style="font-size:15px; border:2px; text-align:center; " placeholder="Please enter password" required="" />

                <!-- <br><br><br>
                <input class="block" type="button" value=" 1 " onclick="calculator.password.value += '1'" />
                <input class="block" type="button" value=" 2 " onclick="calculator.password.value += '2'" />
                <input class="block" type="button" value=" 3 " onclick="calculator.password.value += '3'" />

                <br/>

                <input class="block" type="button" value=" 4 " onclick="calculator.password.value += '4'" />
                <input class="block" type="button" value=" 5 " onclick="calculator.password.value += '5'" />
                <input class="block" type="button" value=" 6 " onclick="calculator.password.value += '6'" />

                </br>

                <input class="block" type="button" value=" 7 " onclick="calculator.password.value += '7'" />
                <input class="block" type="button" value=" 8 " onclick="calculator.password.value += '8'" />
                <input  class="block" type="button" value=" 9 " onclick="calculator.password.value += '9'" />

                </br>

                <input class="block" type="button" value=" c " onclick="calculator.password.value = ''" />
                <input  class="block" type="button" value=" 0 " onclick="calculator.password.value += '0'" /> -->

                <br>
                <br>

                <input name="login" class="block form-control" type="submit" value=" Login" />

                </br>
            </form>

            
        </div>
    </center>
</body>
<div id="agh">
                <p style="color: white"><b>Website : www.chesco-tech.com</b></p>
                <p style="color: white"><b>Support : support@chesco-tech.com</b></p>
                <p style="color: white"><b>Support Calls : 260963325972</b></p>
            </div>
</html>