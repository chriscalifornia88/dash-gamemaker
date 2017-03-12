<?php
/**
 * User: Christian
 * Date: 3/10/2017
 * Time: 3:31 PM
 */
require_once(dirname(__FILE__) . "/vendor/autoload.php");
use Sunra\PhpSimple\HtmlDomParser;

// Prepare db
$dbFile = dirname(__FILE__) . '/GameMaker.docset/Contents/Resources/docSet.dsidx';
file_put_contents($dbFile, "");
$db = new PDO("sqlite:/$dbFile") or die("cannot open the database");
$query = "SELECT * FROM searchIndex;";
$db->query("CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);");
$db->query("CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);");

$entries = [];
$dir = dirname(__FILE__) . "/GameMaker.docset/Contents/Resources/Documents/GameMaker/docs.yoyogames.com/source/dadiospice/";

$directory = new RecursiveDirectoryIterator($dir);
$iterator = new RecursiveIteratorIterator($directory);
$regex = new RegexIterator($iterator, '/^.+\.html$/i', RecursiveRegexIterator::GET_MATCH);

$files = array_keys(iterator_to_array($regex));
foreach ($files as $file) {
    $contents = file_get_contents($file);
    if (strpos($contents, "404 Not Found")) {
        // Remove 404 errors
        unlink($file);
        continue;
    }

    $dom = HtmlDomParser::str_get_html($contents);

    if (count($dom->find('h1')) === 0) {
        // Skip files with no title
        continue;
    }
    $name = $dom->find('h1')[0]->text();

    $type = "Guide";
    if(stripos($name, " statement") !== false) {
        $type = "Statement";
    } else if (strpos($file, "/002_reference/") === false or substr($file, -10) == 'index.html') {
        // Outside of the reference or an index files
        $type = "Guide";
    } else if (count($dom->find('.code')) > 0) {
        if (strpos(substr($dom->find('.code')[0]->text(), -2), ")") !== false) {
            // Has arguments
            $type = "Function";
        } else {
            // Has no arguments
            $type = "Variable";
        }
    }
    $entries[$type][] = $name . '(' . str_replace($dir, "", $file) . ')';

    $path = str_replace(dirname(__FILE__) . '/GameMaker.docset/Contents/Resources/Documents/', '', $file);
    $db->query("INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('$name', '$type', '$path');");
}

file_put_contents(dirname(__FILE__) . "/log.txt", print_r($entries, true));

$db = null;
