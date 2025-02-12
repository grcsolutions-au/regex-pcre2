{-|
The "Text.Regex.PCRE2" module provides a backend for regular
expressions.  If you import this along with other backends, then
you should do so with qualified imports, perhaps renamed for
convenience.

This library uses the newer libpcre2, which supports
UTF8-encoded strings by default.

The regular expression can be provided as a 'ByteString'.  The
regular expression and search string are passed as 'CStringLen's
and may contain NUL bytes and do not need to end in a NUL byte.
'ByteString's are searched in place (via unsafeUseAsCStringLen).

A 'String' will be converted into a 'CStringLen' for processing.
Doing this repeatedly will be very inefficient.

The "Text.Regex.PCRE2.String", "Text.Regex.PCRE2.ByteString", and
"Text.Regex.PCRE2.Wrap" modules provide both the high-level interface
exported by this module and medium- and low-level interfaces that
return errors using 'Either' structures.
-}
{- Copyright: (c) 2025 Homebrew Holdings -}
{- Copyright: (c) 2007 Chris Kuklewicz -}
module Text.Regex.PCRE2(getVersion_Text_Regex_PCRE2
  ,module Text.Regex.Base
  -- ** Wrap, for '=~' and '=~~', types and constants
  ,module Text.Regex.PCRE2.Wrap) where

import Prelude hiding (fail)

import Text.Regex.PCRE2.Wrap(
  Regex, CompOption(CompOption), MatchOption(MatchOption),
  (=~), (=~~),
  unusedOffset, getNumSubs, getVersion,
  compBlank, compAnchored, compEndAnchored, compAllowEmptyClass,
  compAltBSUX, compAltExtendedClass, compAltVerbnames,
  compAutoCallout, compCaseless, compDollarEndOnly, compDotAll,
  compDupNames, compExtended, compExtendedMore, compFirstLine,
  compLiteral, compMatchUnsetBackref, compMultiline,
  compNeverBackslashC, compNoAutoCapture, compNoAutoPossess,
  compNoDotstarAnchor, compNoUTFCheck, compUngreedy, compUTF,
  matchBlank, matchAnchored, matchCopyMatchedSubject,
  matchDisableRecurseLoopCheck, matchEndAnchored, matchNotBOL,
  matchNotEOL, matchNotEmpty, matchNotEmptyAtStart,
  matchNoUTFCheck, matchPartialHard, matchPartialSoft)
import Text.Regex.PCRE2.String()
import Text.Regex.PCRE2.Sequence()
import Text.Regex.PCRE2.ByteString()
import Text.Regex.PCRE2.ByteString.Lazy()
import Data.Version(Version(..))
import Text.Regex.Base
import qualified Paths_regex_pcre2

getVersion_Text_Regex_PCRE2 :: Version
getVersion_Text_Regex_PCRE2 = Paths_regex_pcre2.version
