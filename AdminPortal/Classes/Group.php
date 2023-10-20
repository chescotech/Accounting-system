<?php

class Group
{
    public $conn;

    function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function createGroup(
        // group name argument
        $name,
        // permissions arguments
        $setup_arg,
        $expenses_arg,
        $reports_arg,
        $stock_arg,
        $cash_flow_arg,
        $customer_arg,
        $accounts_arg,
        $users_arg,
        $groups_arg
    ) {
        // insert a row into permissions_tb
        $newPermissions = mysqli_query($this->conn, "INSERT INTO permissions_tb(setup, expenses, customer, stock, reports, cash_flow, accounts, users, groups) VALUES(
        '$setup_arg', 
        '$expenses_arg', 
        '$customer_arg', 
        '$stock_arg', 
        '$reports_arg', 
        '$cash_flow_arg', 
        '$accounts_arg', 
        '$users_arg',
        '$groups_arg'
        )") or die(mysqli_error($this->conn));
        $perm_id = mysqli_insert_id($this->conn);
        $newGroup = mysqli_query($this->conn, "INSERT INTO group_tb(name, permissions_id) VALUES('$name','$perm_id')") or die(mysqli_error($this->conn));

        return $newGroup;
    }

    // check user permission
    public function checkUserPermission(
        $conn,
        $group_id,
        $route_name
    ) {
        // get the permissions id for the group
        $perm_s = mysqli_fetch_assoc(Group::getGroupPermissions($group_id));
        // slice the route name to get only the parent directory
        $route = explode("/", $route_name);
        // e.g. for Groups/groups, only get Groups
        // compare the route name with the entries in the permissions table
        if (array_key_exists(strtolower($route[3]), $perm_s)) {
            $status = $perm_s[strtolower($route[3])] === 'true' ? 'true' : 'false';
        } else {
            $status = 'true';
        }
        // return true or false
        return $status;
    }

    public function getGroups()
    {
        $groups = mysqli_query($this->conn, "SELECT * FROM group_tb");
        return $groups;
    }

    public function getGroupById($id)
    {
        $groupResult = mysqli_query($this->conn, "SELECT * FROM group_tb WHERE id = '$id'");

        // $group = mysql_fetch_array($groupResult);

        return $groupResult;
    }

    public function getGroupMemberCount($id)
    {
        $members = mysqli_query($this->conn, "SELECT COUNT(*) as members FROM user WHERE group_id='$id'") or die(mysqli_error($this->conn));
        $row = mysqli_fetch_array($members);
        $nomembers = $row['members'];
        return $nomembers;
    }
    // get group members
    public function getGroupMembers($id)
    {
        $members = mysqli_query($this->conn, "SELECT * FROM user WHERE group_id = '$id'") or die(mysqli_error($this->conn));
        // $row = mysql_fetch_array($members);
        return $members;
    }
    public function getGroupPermissions($id)
    {
        $perm = mysqli_query($this->conn, "SELECT * FROM group_tb
        LEFT JOIN permissions_tb ON permissions_tb.id = group_tb.permissions_id
        WHERE group_tb.id='$id'") or die(mysqli_errno($this->conn));

        return ($perm);
    }
    public function updateGroup(
        // group id
        $group_id_arg,
        // group name argument
        // $name,
        // permissions arguments
        $setup_arg,
        $expenses_arg,
        $reports_arg,
        $stock_arg,
        $cash_flow_arg,
        $customer_arg,
        $accounts_arg,
        $users_arg,
        $groups_arg
    ) {
        // find the group
        $group = mysqli_query($this->conn, "SELECT * FROM group_tb WHERE id = $group_id_arg");

        // update the row in permissions_tb
        $row = mysqli_fetch_array($group);

        // return var_dump($row['permissions_id']);
        $group_perm = $row['permissions_id'];


        $updatedPermissions = mysqli_query($this->conn, "UPDATE permissions_tb SET setup = '$setup_arg', expenses = '$expenses_arg', reports = '$reports_arg', stock = '$stock_arg', cash_flow = '$cash_flow_arg', customer = '$customer_arg', accounts = '$accounts_arg', users = '$users_arg', groups= '$groups_arg' WHERE permissions_tb.id = '$group_perm' ");

        return $updatedPermissions;
    }

    public function getUserGroup($user_id)
    {
        $retrieve_user_query = mysqli_query($this->conn, "SELECT group_id FROM user WHERE user_id='$user_id'");

        $user_query_results = mysqli_fetch_assoc($retrieve_user_query);

        $user_group_id = $user_query_results['group_id'];

        $retrieve_group_query = mysqli_query($this->conn, "SELECT name FROM groups_tb WHERE id='$user_group_id'");

        $user_group = mysqli_fetch_assoc($retrieve_group_query);
        return $user_group;
    }

    public function updateUserGroup($group_id, $user_id)
    {
        $updateUserQuery = mysqli_query($this->conn, "UPDATE user SET group_id = '$group_id' WHERE users_tb.user_id = '$user_id'");

        if (!$updateUserQuery) {
            die("Query failed: " . mysqli_error($this->conn));
        } else {
            // Query successfully executed
            // Handle the result here if needed
            return $updateUserQuery;
        }
    }
    public function deleteGroup($group_id)
    {
        // delete group
        $perms_query = mysqli_query($this->conn, "SELECT * from group_tb WHERE id='$group_id'");

        $perms = mysqli_fetch_array($perms_query);

        $perm_id = $perms['permissions_id'];
        // return var_dump($perms);

        $group_del_query = mysqli_query($this->conn, "DELETE FROM group_tb WHERE id = '$group_id'");

        // if group deleted, delete permissions
        if ($group_del_query) {
            $del_perms = mysqli_query($this->conn, "DELETE FROM permissions_tb WHERE id='$perm_id'");

            // also set user group to 0
            $update_users = mysqli_query($this->conn, "UPDATE user SET group_id = '0' WHERE user.group_id = '$group_id'");
        }

        return $group_del_query;
    }
}
