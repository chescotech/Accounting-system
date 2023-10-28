<?php

class Company{

    public function compName($con){
        $q = mysqli_query($con, "SELECT branch_name FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $comp_name = $r['branch_name'];

        return $comp_name;
    }

    public function tPin($con){
        $q = mysqli_query($con, "SELECT tpin FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $tpin = $r['tpin'];

        return $tpin;
    }

    public function address($con){
        $q = mysqli_query($con, "SELECT branch_address FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_address = $r['branch_address'];

        return $branch_address;
    }

    public function GetBankAccountName($con){
        $q = mysqli_query($con, "SELECT bank_account_name FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['bank_account_name'];

        return $branch_contact;
    }
    
    
      public function getBankName($con){
        $q = mysqli_query($con, "SELECT bank FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['bank'];
        return $branch_contact;
    }
    
      public function getAccountNumber($con){
        $q = mysqli_query($con, "SELECT account_number FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['account_number'];
        return $branch_contact;
    }
    
      public function contact($con){
        $q = mysqli_query($con, "SELECT branch_contact FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['branch_contact'];

        return $branch_contact;
    }
    
      public function getSortcode($con){
        $q = mysqli_query($con, "SELECT sort_code FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['sort_code'];

        return $branch_contact;
    }
        
     public function getBranchCode($con){
        $q = mysqli_query($con, "SELECT branch_code FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $branch_contact = $r['branch_code'];
        return $branch_contact;
    }

    public function logo($con){
        $q = mysqli_query($con, "SELECT logo FROM branch LIMIT 1 ");
        $r = mysqli_fetch_array($q);
        $logo = $r['logo'];

        return $logo;
    }


}