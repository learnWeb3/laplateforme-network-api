<?php

class Application
{

    // converting ModelName to table_names

    public static function getTableName($model_name)
    {

        preg_match_all("/[A-Z][a-z]+/", $model_name, $results);
        $model_name =  isset($results[0]) ? implode("_", $results[0]) : $model_name;
        $table_name = strtolower($model_name);
        $replace_y = str_replace("y", "ies", $table_name);
        return $replace_y === $table_name ? $table_name . "s" : $replace_y;
    }

    // fetching last created row 
    public static function lastCreatedRow(PDO $connection)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name ORDER BY id DESC LIMIT 1";
        return Request::send($connection, $request_body, []);
    }

    // creating a record in database
    public static function create(PDO $connection, array $column_names, array $request_parameters)
    {
        $table_name = self::getTableName(get_called_class());
        $prepared_query_parameters = implode(",", array_map(function ($el) {
            return "?";
        }, $column_names));
        $request_body = "INSERT INTO $table_name (" . implode(",", $column_names) . ") VALUES (" . $prepared_query_parameters . ")";
        Request::send($connection, $request_body, $request_parameters);
        return self::lastCreatedRow($connection)->fetchAll(PDO::FETCH_ASSOC);
    }

    // Updating a record in database
    public static function update(PDO $connection, array $column_names, array $request_parameters, string $target_column, $target_value)
    {
        $table_name = self::getTableName(get_called_class());
        $prepared_query_parameters = implode(",", array_map(function ($el) {
            return "$el=?";
        }, $column_names));
        $request_body = "UPDATE $table_name SET $prepared_query_parameters WHERE $target_column=$target_value";
        $request = Request::send($connection, $request_body, $request_parameters);
        return self::where($connection, $target_column, $target_value)->fetchAll(PDO::FETCH_ASSOC)[0];
    }


    // deleting a record in database

    public static function delete(PDO $connection, array $request_parameters, string $target_column, $target_value)
    {
        $model = get_called_class();
        $table_name = self::getTableName($model);
        $request_body = "DELETE FROM $table_name WHERE $target_column=$target_value";
        Request::send($connection, $request_body, $request_parameters);
        return "Entry of type $model with $target_column=$target_value has been deleted successfully";
    }


    // fetching database datas by id 
    public static function find(PDO $connection, int $id)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name WHERE id=?";
        $request_parameters = [$id];
        return Request::send($connection, $request_body, $request_parameters);
    }

    // fetching databse datas by column name
    public static function where(PDO $connection, string $column_name, $value)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name WHERE $column_name=?";
        $request_parameters = [$value];
        return Request::send($connection, $request_body, $request_parameters);
    }

    // fetching database datas by regex pattern match on column
    public static function like(PDO $connection, string $column_name, $value)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name WHERE $column_name LIKE ?";
        $request_parameters = [$value];
        return Request::send($connection, $request_body, $request_parameters);
    }

    // fetching all datas related to a table
    public static function all(PDO $connection, string $endpoint_path, int $start = 0, int $limit = 10)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name ORDER BY $table_name.created_at LIMIT $limit OFFSET $start";
        $request_parameters = [];
        $results  = Request::send($connection, $request_body, $request_parameters)->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $endpoint_path . "?start=$next_start&limit=$limit",
            "previous" => $endpoint_path . "?start=$previous_start&limit=$limit"
        );
    }

    // looking for datas in a given table according to regex pattern %%
    public static function searchByString(PDO $connection, array $query_params, string $endpoint_path, int $start = 0, int $limit = 10)
    {
        $parameters = self::prepareQueryParams($query_params);
        $keys = $parameters['keys'];
        $values = $parameters['values'];
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name WHERE $keys ORDER BY $table_name.created_at LIMIT $limit OFFSET $start";
        $results = Request::send($connection, $request_body, $values)->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $endpoint_path . "?start=$next_start&limit=$limit",
            "previous" => $endpoint_path . "?start=$previous_start&limit=$limit"
        );
    }

    // empty table and reset autoincrement
    public static function destroyAll(PDO $connection)
    {
        $table_name = self::getTableName(get_called_class());
        $request_body = "DELETE FROM $table_name";
        Request::send($connection, $request_body, []);
        $request_body = "ALTER TABLE $table_name AUTO_INCREMENT=1";
        Request::send($connection, $request_body, []);
    }

    // prepare query parameters
    protected static function prepareQueryParams($query_params)
    {
        $prepared_parameters = [];
        $prepared_values = [];
        foreach ($query_params as $key => $value) {
            $prepared_parameters[] = $key . ' LIKE ?';
            $prepared_values[] = '%' . $value . '%';
        }
        $prepared_parameters = implode(' AND ', $prepared_parameters);
        return ["keys" => $prepared_parameters, "values" => $prepared_values];
    }
}
