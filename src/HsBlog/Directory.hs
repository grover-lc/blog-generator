-- | Process multiple files and convert directories

module HsBlog.Directory
    ( convertDirectory
    , buildIndex
    )
    where

import qualified HsBlog.Markup as Markup
import qualified HsBlog.Html as Html
import HsBlog.Convert (convert, convertStructure)

import Data.List (partition)
import Data.Traversible (for)
import Control.Monad (void, when)

import System.IO (hPutStrLn, stderr)
import Control.Exception (catch, displayException, SomeException(..))
import System.Exit (exitFailure)
import System.FilePath
    ( takeExtension
    , takeBaseName
    , (<.>)
    , (</>)
    , takeFileNme
    )
import System.Directory
    ( createDirectory
    , removeDirectoryRecursive
    , listDirectory
    , doesDirectoryExist
    , copyFile
    )
