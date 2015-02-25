
//-------------------------#include---------------------------------------------
//***************************************************************************
//
//  Author(s)...: Pavel Bobkov     http://ChipEnable.Ru   
//
//  Target(s)...: ATMega
//
//  Compiler....: IAR, GCC, CodeVision
//
//  Description.: файл для совместимости с компиляторами IAR, CodeVision, GNU GCC
//
//  Data........: 20.07.13
//  Data........: 08.01.14  FLASH_VAR(x)
//
//***************************************************************************


/* stdint.h standard header */
/* Copyright 2003-2010 IAR Systems AB.  */

  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __TAABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */





/* A definiton for a function of what effects it has.
   NS  = no_state, i.e. it uses no internal or external state. It may write
         to errno though
   NE  = no_state, no_errno,  i.e. it uses no internal or external state,
         not even writing to errno. 
   NRx = no_read(x), i.e. it doesn't read through pointer parameter x.
   NWx = no_write(x), i.e. it doesn't write through pointer parameter x.
*/






/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */


  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __TAABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */





                /* Convenience macros */



/* Used to refer to '__taabi' symbols in the library. */ 

                /* Versions */



/*
 * Support for some C99 or other symbols
 *
 * This setting makes available some macros, functions, etc that are
 * beneficial.
 *
 * Default is to include them.
 *
 * Disabling this in C++ mode will not compile (some C++ functions uses C99
 * functionality).
 */

  /* Default turned on when compiling C++, EC++, or C99. */



                /* Configuration */
/***************************************************
 *
 * DLib_Defaults.h is the library configuration manager.
 *
 * Copyright 2003-2010 IAR Systems AB.  
 *
 * This configuration header file performs the following tasks:
 *
 * 1. Includes the configuration header file, defined by _DLIB_CONFIG_FILE,
 *    that sets up a particular runtime environment.
 *
 * 2. Includes the product configuration header file, DLib_Product.h, that
 *    specifies default values for the product and makes sure that the
 *    configuration is valid.
 *
 * 3. Sets up default values for all remaining configuration symbols.
 *
 * This configuration header file, the one defined by _DLIB_CONFIG_FILE, and
 * DLib_Product.h configures how the runtime environment should behave. This
 * includes all system headers and the library itself, i.e. all system headers
 * includes this configuration header file, and the library has been built
 * using this configuration header file.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/


  #pragma system_include

/* Include the main configuration header file. */
/* Customer-specific DLib configuration. */
/* Copyright (C) 2003 IAR Systems AB.  All rights reserved. */


/*
 * Set Buffert size used in qsort
 *
 */



  /* _DLIB_CONFIG_FILE_STRING is the quoted variant of above */

/* Include the product specific header file. */
/* Product-specific DLib configuration. */
/* Copyright (C) 2003 IAR Systems AB.  All rights reserved. */


/*
 * This file is included right after the _DLIB_CONFIG_FILE
 * (like DLib_Config.h) file that the user can use to configure the library.
 * The file DLib_Defaults.h is then included to set up defaults for all
 * configuration variables that haven't got a value.
 *
 * Typically, this file can contain two things:
 *
 * - Set up defaults that differs from DLib_Defaults.h.  Remember to
 *   honor the values specified in DLib_Defaults, for example:
 *
 *   #ifndef _DLIB_MULTIBYTE
 *   #define _DLIB_MULTIBYTE 1
 *   #endif
 *
 * - Check that configurations not supported by the product isn't used,
 *   for example:
 *
 *   #ifdef _DLIB_FLOAT_ENVIRONMENT
 *   #if _DLIB_FLOAT_ENVIRONMENT
 *   #error "This product does not support a floating point environment"
 *   #endif
 *   #endif
 */













/*
 * The remainder of the file sets up defaults for a number of
 * configuration symbols, each corresponds to a feature in the
 * libary.
 *
 * The value of the symbols should either be 1, if the feature should
 * be supported, or 0 if it shouldn't. (Except where otherwise
 * noted.)
 */


/*
 * Small or Large target
 *
 * This define determines whether the target is large or small. It must be 
 * setup in the DLib_Product header or in the compiler itself.
 *
 * For a small target some functionality in the library will not deliver 
 * the best available results. For instance the _accurate variants will not use
 * the extra precision packet for large arguments.
 * 
 */



/*
 * File handling
 *
 * Determines whether FILE descriptors and related functions exists or not.
 * When this feature is selected, i.e. set to 1, then FILE descriptors and
 * related functions (e.g. fprintf, fopen) exist. All files, even stdin,
 * stdout, and stderr will then be handled with a file system mechanism that
 * buffers files before accessing the lowlevel I/O interface (__open, __read,
 * __write, etc).
 *
 * If not selected, i.e. set to 0, then FILE descriptors and related functions
 * (e.g. fprintf, fopen) does not exist. All functions that normally uses
 * stderr will use stdout instead. Functions that uses stdout and stdin (like
 * printf and scanf) will access the lowlevel I/O interface directly (__open,
 * __read, __write, etc), i.e. there will not be any buffering.
 *
 * The default is not to have support for FILE descriptors.
 */


/*
 * Use static buffers for stdout
 *
 * This setting controls whether the stream stdout uses a static 80 bytes
 * buffer or uses a one byte buffer allocated in the file descriptor. This
 * setting is only applicable if the FILE descriptors are enabled above.
 *
 * Default is to use a static 80 byte buffer.
 */


/*
 * Support of locale interface
 *
 * "Locale" is the system in C that support language- and
 * contry-specific settings for a number of areas, including currency
 * symbols, date and time, and multibyte encodings.
 *
 * This setting determines whether the locale interface exist or not.
 * When this feature is selected, i.e. set to 1, the locale interface exist
 * (setlocale, etc). A number of preselected locales can be activated during
 * runtime. The preselected locales and encodings is choosen by defining any
 * number of _LOCALE_USE_xxx and _ENCODING_USE_xxx symbols. The application
 * will start with the "C" locale choosen. (Single byte encoding is always
 * supported in this mode.)
 *
 *
 * If not selected, i.e. set to 0, the locale interface (setlocale, etc) does
 * not exist. One preselected locale and one preselected encoding is then used
 * directly. That locale can not be changed during runtime. The preselected
 * locale and encoding is choosen by defining at most one of _LOCALE_USE_xxx
 * and at most one of _ENCODING_USE_xxx. The default is to use the "C" locale
 * and the single byte encoding, respectively.
 *
 * The default is not to have support for the locale interface with the "C"
 * locale and the single byte encoding.
 *
 * Supported locales
 * -----------------
 * _LOCALE_USE_C                  C standard locale (the default)
 * _LOCALE_USE_POSIX ISO-8859-1   Posix locale
 * _LOCALE_USE_CS_CZ ISO-8859-2   Czech language locale for Czech Republic
 * _LOCALE_USE_DA_DK ISO-8859-1   Danish language locale for Denmark
 * _LOCALE_USE_DA_EU ISO-8859-15  Danish language locale for Europe
 * _LOCALE_USE_DE_AT ISO-8859-1   German language locale for Austria
 * _LOCALE_USE_DE_BE ISO-8859-1   German language locale for Belgium
 * _LOCALE_USE_DE_CH ISO-8859-1   German language locale for Switzerland
 * _LOCALE_USE_DE_DE ISO-8859-1   German language locale for Germany
 * _LOCALE_USE_DE_EU ISO-8859-15  German language locale for Europe
 * _LOCALE_USE_DE_LU ISO-8859-1   German language locale for Luxemburg
 * _LOCALE_USE_EL_EU ISO-8859-7x  Greek language locale for Europe
 *                                (Euro symbol added)
 * _LOCALE_USE_EL_GR ISO-8859-7   Greek language locale for Greece
 * _LOCALE_USE_EN_AU ISO-8859-1   English language locale for Australia
 * _LOCALE_USE_EN_CA ISO-8859-1   English language locale for Canada
 * _LOCALE_USE_EN_DK ISO_8859-1   English language locale for Denmark
 * _LOCALE_USE_EN_EU ISO-8859-15  English language locale for Europe
 * _LOCALE_USE_EN_GB ISO-8859-1   English language locale for United Kingdom
 * _LOCALE_USE_EN_IE ISO-8859-1   English language locale for Ireland
 * _LOCALE_USE_EN_NZ ISO-8859-1   English language locale for New Zealand
 * _LOCALE_USE_EN_US ISO-8859-1   English language locale for USA
 * _LOCALE_USE_ES_AR ISO-8859-1   Spanish language locale for Argentina
 * _LOCALE_USE_ES_BO ISO-8859-1   Spanish language locale for Bolivia
 * _LOCALE_USE_ES_CL ISO-8859-1   Spanish language locale for Chile
 * _LOCALE_USE_ES_CO ISO-8859-1   Spanish language locale for Colombia
 * _LOCALE_USE_ES_DO ISO-8859-1   Spanish language locale for Dominican Republic
 * _LOCALE_USE_ES_EC ISO-8859-1   Spanish language locale for Equador
 * _LOCALE_USE_ES_ES ISO-8859-1   Spanish language locale for Spain
 * _LOCALE_USE_ES_EU ISO-8859-15  Spanish language locale for Europe
 * _LOCALE_USE_ES_GT ISO-8859-1   Spanish language locale for Guatemala
 * _LOCALE_USE_ES_HN ISO-8859-1   Spanish language locale for Honduras
 * _LOCALE_USE_ES_MX ISO-8859-1   Spanish language locale for Mexico
 * _LOCALE_USE_ES_PA ISO-8859-1   Spanish language locale for Panama
 * _LOCALE_USE_ES_PE ISO-8859-1   Spanish language locale for Peru
 * _LOCALE_USE_ES_PY ISO-8859-1   Spanish language locale for Paraguay
 * _LOCALE_USE_ES_SV ISO-8859-1   Spanish language locale for Salvador
 * _LOCALE_USE_ES_US ISO-8859-1   Spanish language locale for USA
 * _LOCALE_USE_ES_UY ISO-8859-1   Spanish language locale for Uruguay
 * _LOCALE_USE_ES_VE ISO-8859-1   Spanish language locale for Venezuela
 * _LOCALE_USE_ET_EE ISO-8859-1   Estonian language for Estonia
 * _LOCALE_USE_EU_ES ISO-8859-1   Basque language locale for Spain
 * _LOCALE_USE_FI_EU ISO-8859-15  Finnish language locale for Europe
 * _LOCALE_USE_FI_FI ISO-8859-1   Finnish language locale for Finland
 * _LOCALE_USE_FO_FO ISO-8859-1   Faroese language locale for Faroe Islands
 * _LOCALE_USE_FR_BE ISO-8859-1   French language locale for Belgium
 * _LOCALE_USE_FR_CA ISO-8859-1   French language locale for Canada
 * _LOCALE_USE_FR_CH ISO-8859-1   French language locale for Switzerland
 * _LOCALE_USE_FR_EU ISO-8859-15  French language locale for Europe
 * _LOCALE_USE_FR_FR ISO-8859-1   French language locale for France
 * _LOCALE_USE_FR_LU ISO-8859-1   French language locale for Luxemburg
 * _LOCALE_USE_GA_EU ISO-8859-15  Irish language locale for Europe
 * _LOCALE_USE_GA_IE ISO-8859-1   Irish language locale for Ireland
 * _LOCALE_USE_GL_ES ISO-8859-1   Galician language locale for Spain
 * _LOCALE_USE_HR_HR ISO-8859-2   Croatian language locale for Croatia
 * _LOCALE_USE_HU_HU ISO-8859-2   Hungarian language locale for Hungary
 * _LOCALE_USE_ID_ID ISO-8859-1   Indonesian language locale for Indonesia
 * _LOCALE_USE_IS_EU ISO-8859-15  Icelandic language locale for Europe
 * _LOCALE_USE_IS_IS ISO-8859-1   Icelandic language locale for Iceland
 * _LOCALE_USE_IT_EU ISO-8859-15  Italian language locale for Europe
 * _LOCALE_USE_IT_IT ISO-8859-1   Italian language locale for Italy
 * _LOCALE_USE_IW_IL ISO-8859-8   Hebrew language locale for Israel
 * _LOCALE_USE_KL_GL ISO-8859-1   Greenlandic language locale for Greenland
 * _LOCALE_USE_LT_LT   BALTIC     Lithuanian languagelocale for Lithuania
 * _LOCALE_USE_LV_LV   BALTIC     Latvian languagelocale for Latvia
 * _LOCALE_USE_NL_BE ISO-8859-1   Dutch language locale for Belgium
 * _LOCALE_USE_NL_EU ISO-8859-15  Dutch language locale for Europe
 * _LOCALE_USE_NL_NL ISO-8859-9   Dutch language locale for Netherlands
 * _LOCALE_USE_NO_EU ISO-8859-15  Norwegian language locale for Europe
 * _LOCALE_USE_NO_NO ISO-8859-1   Norwegian language locale for Norway
 * _LOCALE_USE_PL_PL ISO-8859-2   Polish language locale for Poland
 * _LOCALE_USE_PT_BR ISO-8859-1   Portugese language locale for Brazil
 * _LOCALE_USE_PT_EU ISO-8859-15  Portugese language locale for Europe
 * _LOCALE_USE_PT_PT ISO-8859-1   Portugese language locale for Portugal
 * _LOCALE_USE_RO_RO ISO-8859-2   Romanian language locale for Romania
 * _LOCALE_USE_RU_RU ISO-8859-5   Russian language locale for Russia
 * _LOCALE_USE_SL_SI ISO-8859-2   Slovenian language locale for Slovenia
 * _LOCALE_USE_SV_EU ISO-8859-15  Swedish language locale for Europe
 * _LOCALE_USE_SV_FI ISO-8859-1   Swedish language locale for Finland
 * _LOCALE_USE_SV_SE ISO-8859-1   Swedish language locale for Sweden
 * _LOCALE_USE_TR_TR ISO-8859-9   Turkish language locale for Turkey
 *
 *  Supported encodings
 *  -------------------
 * n/a                            Single byte (used if no other is defined).
 * _ENCODING_USE_UTF8             UTF8 encoding.
 */


/* We need to have the "C" locale if we have full locale support. */


/*
 * Support of multibytes in printf- and scanf-like functions
 *
 * This is the default value for _DLIB_PRINTF_MULTIBYTE and
 * _DLIB_SCANF_MULTIBYTE. See them for a description.
 *
 * Default is to not have support for multibytes in printf- and scanf-like
 * functions.
 */



/*
 * Throw handling in the EC++ library
 *
 * This setting determines what happens when the EC++ part of the library
 * fails (where a normal C++ library 'throws').
 *
 * The following alternatives exists (setting of the symbol):
 * 0                - The application does nothing, i.e. continues with the
 *                    next statement.
 * 1                - The application terminates by calling the 'abort'
 *                    function directly.
 * <anything else>  - An object of class "exception" is created.  This
 *                    object contains a string describing the problem.
 *                    This string is later emitted on "stderr" before
 *                    the application terminates by calling the 'abort'
 *                    function directly.
 *
 * Default is to do nothing.
 */



/*
 * Hexadecimal floating-point numbers in strtod
 *
 * If selected, i.e. set to 1, strtod supports C99 hexadecimal floating-point
 * numbers. This also enables hexadecimal floating-points in internal functions
 * used for converting strings and wide strings to float, double, and long
 * double.
 *
 * If not selected, i.e. set to 0, C99 hexadecimal floating-point numbers
 * aren't supported.
 *
 * Default is not to support hexadecimal floating-point numbers.
 */



/*
 * Printf configuration symbols.
 *
 * All the configuration symbols described further on controls the behaviour
 * of printf, sprintf, and the other printf variants.
 *
 * The library proves four formatters for printf: 'tiny', 'small',
 * 'large', and 'default'.  The setup in this file controls all except
 * 'tiny'.  Note that both small' and 'large' explicitly removes
 * some features.
 */

/*
 * Handle multibytes in printf
 *
 * This setting controls whether multibytes and wchar_ts are supported in
 * printf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */


/*
 * Long long formatting in printf
 *
 * This setting controls long long support (%lld) in printf. Set to 1 to
 * support it, otherwise set to 0.

 * Note, if long long should not be supported and 'intmax_t' is larger than
 * an ordinary 'long', then %jd and %jn will not be supported.
 *
 * Default is to support long long formatting.
 */




/*
 * Floating-point formatting in printf
 *
 * This setting controls whether printf supports floating-point formatting.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting.
 */


/*
 * Hexadecimal floating-point formatting in printf
 *
 * This setting controls whether the %a format, i.e. the output of
 * floating-point numbers in the C99 hexadecimal format. Set to 1 to support
 * it, otherwise set to 0.
 *
 * Default is to support %a in printf.
 */


/*
 * Output count formatting in printf
 *
 * This setting controls whether the output count specifier (%n) is supported
 * or not in printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support %n in printf.
 */


/*
 * Support of qualifiers in printf
 *
 * This setting controls whether qualifiers that enlarges the input value
 * [hlLjtz] is supported in printf or not. Set to 1 to support them, otherwise
 * set to 0. See also _DLIB_PRINTF_INT_TYPE_IS_INT and
 * _DLIB_PRINTF_INT_TYPE_IS_LONG.
 *
 * Default is to support [hlLjtz] qualifiers in printf.
 */


/*
 * Support of flags in printf
 *
 * This setting controls whether flags (-+ #0) is supported in printf or not.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support flags in printf.
 */


/*
 * Support widths and precisions in printf
 *
 * This setting controls whether widths and precisions are supported in printf.
 * Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support widths and precisions in printf.
 */


/*
 * Support of unsigned integer formatting in printf
 *
 * This setting controls whether unsigned integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in printf.
 */


/*
 * Support of signed integer formatting in printf
 *
 * This setting controls whether signed integer formatting is supported in
 * printf. Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support signed integer formatting in printf.
 */


/*
 * Support of formatting anything larger than int in printf
 *
 * This setting controls if 'int' should be used internally in printf, rather
 * than the largest existing integer type. If 'int' is used, any integer or
 * pointer type formatting use 'int' as internal type even though the
 * formatted type is larger. Set to 1 to use 'int' as internal type, otherwise
 * set to 0.
 *
 * See also next configuration.
 *
 * Default is to internally use largest existing internally type.
 */


/*
 * Support of formatting anything larger than long in printf
 *
 * This setting controls if 'long' should be used internally in printf, rather
 * than the largest existing integer type. If 'long' is used, any integer or
 * pointer type formatting use 'long' as internal type even though the
 * formatted type is larger. Set to 1 to use 'long' as internal type,
 * otherwise set to 0.
 *
 * See also previous configuration.
 *
 * Default is to internally use largest existing internally type.
 */



/*
 * Emit a char a time in printf
 *
 * This setting controls internal output handling. If selected, i.e. set to 1,
 * then printf emits one character at a time, which requires less code but
 * can be slightly slower for some types of output.
 *
 * If not selected, i.e. set to 0, then printf buffers some outputs.
 *
 * Note that it is recommended to either use full file support (see
 * _DLIB_FILE_DESCRIPTOR) or -- for debug output -- use the linker
 * option "-e__write_buffered=__write" to enable buffered I/O rather
 * than deselecting this feature.
 */



/*
 * Scanf configuration symbols.
 *
 * All the configuration symbols described here controls the
 * behaviour of scanf, sscanf, and the other scanf variants.
 *
 * The library proves three formatters for scanf: 'small', 'large',
 * and 'default'.  The setup in this file controls all, however both
 * 'small' and 'large' explicitly removes some features.
 */

/*
 * Handle multibytes in scanf
 *
 * This setting controls whether multibytes and wchar_t:s are supported in
 * scanf. Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default.
 */


/*
 * Long long formatting in scanf
 *
 * This setting controls whether scanf supports long long support (%lld). It
 * also controls, if 'intmax_t' is larger than an ordinary 'long', i.e. how
 * the %jd and %jn specifiers behaves. Set to 1 to support them, otherwise set
 * to 0.
 *
 * Default is to support long long formatting in scanf.
 */



/*
 * Support widths in scanf
 *
 * This controls whether scanf supports widths. Set to 1 to support them,
 * otherwise set to 0.
 *
 * Default is to support widths in scanf.
 */


/*
 * Support qualifiers [hjltzL] in scanf
 *
 * This setting controls whether scanf supports qualifiers [hjltzL] or not. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support qualifiers in scanf.
 */


/*
 * Support floating-point formatting in scanf
 *
 * This setting controls whether scanf supports floating-point formatting. Set
 * to 1 to support them, otherwise set to 0.
 *
 * Default is to support floating-point formatting in scanf.
 */


/*
 * Support output count formatting (%n)
 *
 * This setting controls whether scanf supports output count formatting (%n).
 * Set to 1 to support it, otherwise set to 0.
 *
 * Default is to support output count formatting in scanf.
 */


/*
 * Support scansets ([]) in scanf
 *
 * This setting controls whether scanf supports scansets ([]) or not. Set to 1
 * to support them, otherwise set to 0.
 *
 * Default is to support scansets in scanf.
 */


/*
 * Support signed integer formatting in scanf
 *
 * This setting controls whether scanf supports signed integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support signed integer formatting in scanf.
 */


/*
 * Support unsigned integer formatting in scanf
 *
 * This setting controls whether scanf supports unsigned integer formatting or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support unsigned integer formatting in scanf.
 */


/*
 * Support assignment suppressing [*] in scanf
 *
 * This setting controls whether scanf supports assignment suppressing [*] or
 * not. Set to 1 to support them, otherwise set to 0.
 *
 * Default is to support assignment suppressing in scanf.
 */


/*
 * Handle multibytes in asctime and strftime.
 *
 * This setting controls whether multibytes and wchar_ts are
 * supported.Set to 1 to support them, otherwise set to 0.
 *
 * See _DLIB_FORMATTED_MULTIBYTE for the default setting.
 */


/*
 * True if "qsort" should be implemented using bubble sort.
 *
 * Bubble sort is less efficient than quick sort but requires less RAM
 * and ROM resources.
 */


/*
 * Set Buffert size used in qsort
 */


/*
 * The default "rand" function uses an array of 32 long:s of memory to
 * store the current state.
 *
 * The simple "rand" function uses only a single long. However, the
 * quality of the generated psuedo-random numbers are not as good as
 * the default implementation.
 */


/*
 * Wide character and multi byte character support in library.
 */


/*
 * Set attributes on the function used by the C-SPY debug interface to set a
 * breakpoint in.
 */


/*
 * Support threading in the library
 *
 * 0    No thread support
 * 1    Thread support with a, b, and d.
 * 2    Thread support with a, b, and e.
 * 3    Thread support with all thread-local storage in a dynamically allocated
 *        memory area and a, and b.
 *      a. Lock on heap accesses
 *      b. Optional lock on file accesses (see _DLIB_FILE_OP_LOCKS below)
 *      d. Use an external thread-local storage interface for all the
 *         libraries static and global variables.
 *      e. Static and global variables aren't safe for access from several
 *         threads.
 *
 * Note that if locks are used the following symbols must be defined:
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * They will be used to initialize the needed locks only once. TYPE is the
 * type for the static control variable, MACRO is the expression that will be
 * evaluated at each usage of a lock, and INIT is the initializer for the
 * control variable.
 *
 * Note that if thread model 3 is used the symbol _DLIB_TLS_POINTER must be
 * defined. It is a thread local pointer to a dynamic memory area that
 * contains all used TLS variables for the library. Optionally the following
 * symbols can be defined as well (default is to use the default const data
 * and data memories):
 *
 *   _DLIB_TLS_INITIALIZER_MEMORY The memory to place the initializers for the
 *                                TLS memory area
 *   _DLIB_TLS_MEMORY             The memory to use for the TLS memory area. A
 *                                pointer to this memory must be castable to a
 *                                default pointer and back.
 *   _DLIB_TLS_REQUIRE_INIT       Set to 1 to require __cstart_init_tls
 *                                when needed to initialize the TLS data
 *                                segment for the main thread.
 *   _DLIB_TLS_SEGMENT_DATA       The name of the TLS RAM data segment
 *   _DLIB_TLS_SEGMENT_INIT       The name of the used to initialize the
 *                                TLS data segment.
 *
 * See DLib_Threads.h for a description of what interfaces needs to be
 * defined for thread support.
 */


/*
 * Used by products where one runtime library can be used by applications
 * with different data models, in order to reduce the total number of
 * libraries required. Typically, this is used when the pointer types does
 * not change over the data models used, but the placement of data variables
 * or/and constant variables do.
 *
 * If defined, this symbol is typically defined to the memory attribute that
 * is used by the runtime library. The actual define must use a
 * _Pragma("type_attribute = xxx") construct. In the header files, it is used
 * on all statically linked data objects seen by the application.
 */



/*
 * Turn on support for the Target-specific ABI. The ABI is based on the
 * ARM AEABI. A target, except ARM, may deviate from it.
 */




/*
 * Turn on usage of a pragma to tell the linker the number of elements used
 * in a setjmp jmp_buf.
 */


/*
 * If true, the product supplies a "DLib_Product_string.h" file that
 * is included from "string.h".
 */


/*
 * Determine whether the math fma routines are fast or not.
 */

/*
 * Rtti support.
 */


/*
 * Use the "pointers to short" or "pointers to long" implementation of 
 * the basic floating point routines (like Dnorm, Dtest, Dscale, and Dunscale).
 */

/*
 * Use 64-bit long long as intermediary type in Dtest, and fabs.
 * Default is to do this if long long is 64-bits.
 */

/*
 * Favor speed versus some size enlargements in floating point functions.
 */

/*
 * Include dlmalloc as an alternative heap manager in product.
 *
 * Typically, an application will use a "malloc" heap manager that is
 * relatively small but not that efficient. An application can
 * optionally use the "dlmalloc" package, which provides a more
 * effective "malloc" heap manager, if it is included in the product
 * and supported by the settings.
 *
 * See the product documentation on how to use it, and whether or not
 * it is included in the product.
 */
  /* size_t/ptrdiff_t must be a 4 bytes unsigned integer. */


/*
 * Allow the 64-bit time_t interface?
 *
 * Default is yes if long long is 64 bits.
 */
  #pragma language = save 
  #pragma language = extended
  #pragma language = restore


/*
 * Is time_t 64 or 32 bits?
 *
 * Default is 32 bits.
 */

/*
 * Do we include math functions that demands lots of constant bytes?
 * (like erf, erfc, expm1, fma, lgamma, tgamma, and *_accurate)
 *
 */

/*
 * Set this to __weak, if supported.
 *
 */


/*
 * Deleted options
 *
 */








                /* Floating-point */

/*
 * Whenever a floating-point type is equal to another, we try to fold those
 * two types into one. This means that if float == double then we fold float to
 * use double internally. Example sinf(float) will use _Sin(double, uint).
 *
 * _X_FNAME is a redirector for internal support routines. The X can be
 *          D (double), F (float), or L (long double). It redirects by using
 *          another prefix. Example calls to Dtest will be __iar_Dtest,
 *          __iar_FDtest, or __iarLDtest.
 * _X_FUN   is a redirector for functions visible to the customer. As above, the
 *          X can be D, F, or L. It redirects by using another suffix. Example
 *          calls to sin will be sin, sinf, or sinl.
 * _X_TYPE  The type that one type is folded to.
 * _X_PTRCAST is a redirector for a cast operation involving a pointer.
 * _X_CAST  is a redirector for a cast involving the float type.
 *
 * _FLOAT_IS_DOUBLE signals that all internal float routines aren't needed.
 * _LONG_DOUBLE_IS_DOUBLE signals that all internal long double routines
 *                        aren't needed.
 */


                /* NAMING PROPERTIES */

/* Has support for fixed point types */

/* Has support for secure functions (printf_s, scanf_s, etc) */
/* Will not compile if enabled */

/* Has support for complex C types */

/* If is Embedded C++ language */

/* If is true C++ language */

/* True C++ language setup */



                /* NAMESPACE CONTROL */






/* xencoding_limits.h internal header file */
/* Copyright 2003-2010 IAR Systems AB.  */


  #pragma system_include

/* ycheck.h internal checking header file. */
/* Copyright 2005-2010 IAR Systems AB. */

/* Note that there is no include guard for this header. This is intentional. */

  #pragma system_include

/* __INTRINSIC
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that intrinsic support could be turned off
 * individually for each file.
 */


/* __TAABI_PORTABILITY_INTERNAL_LEVEL
 *
 * Note: Redefined each time ycheck.h is included, i.e. for each
 * system header, to ensure that ABI support could be turned off/on
 * individually for each file.
 *
 * Possible values for this preprocessor symbol:
 *
 * 0 - ABI portability mode is disabled.
 *
 * 1 - ABI portability mode (version 1) is enabled.
 *
 * All other values are reserved for future use.
 */




/* yvals.h internal configuration header file. */
/* Copyright 2001-2010 IAR Systems AB. */


/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

                                /* Multibyte encoding length. */





                                /* Utility macro */








                /* FLOATING-POINT PROPERTIES */

                /* float properties */

                /* double properties */

                /* long double properties */
                /* (must be same as double) */



                /* INTEGER PROPERTIES */
                                /* MB_LEN_MAX */


  #pragma language=save
  #pragma language=extended
  typedef long long _Longlong;
  typedef unsigned long long _ULonglong;
  #pragma language=restore

  typedef unsigned short int _Wchart;
  typedef unsigned short int _Wintt;



                /* POINTER PROPERTIES */

typedef signed char  _Ptrdifft;
typedef unsigned char     _Sizet;

/* IAR doesn't support restrict  */

                /* stdarg PROPERTIES */

  typedef struct __va_list
  {
    char  *_Ap;
  } __va_list;
  typedef __va_list __Va_list;


__intrinsic __nounwind void __iar_Atexit(void (*)(void));


  typedef struct
  {       /* state of a multibyte translation */
    unsigned long _Wchar;      /* Used as an intermediary value (up to 32-bits) */
    unsigned long _State;      /* Used as a state value (only some bits used) */
  } _Mbstatet;





typedef struct
{       /* file position */
  long _Off;    /* can be system dependent */
  _Mbstatet _Wstate;
} _Fpost;




                /* THREAD AND LOCALE CONTROL */

/***************************************************
 *
 * DLib_Threads.h is the library threads manager.
 *
 * Copyright 2004-2010 IAR Systems AB.  
 *
 * This configuration header file sets up how the thread support in the library
 * should work.
 *
 ***************************************************
 *
 * DO NOT MODIFY THIS FILE!
 *
 ***************************************************/


  #pragma system_include

/*
 * DLib can support a multithreaded environment. The preprocessor symbol 
 * _DLIB_THREAD_SUPPORT governs the support. It can be 0 (no support), 
 * 1 (currently not supported), 2 (locks only), and 3 (simulated TLS and locks).
 */

/*
 * This header sets the following symbols that governs the rest of the
 * library:
 * ------------------------------------------
 * _DLIB_MULTI_THREAD     0 No thread support
 *                        1 Multithread support
 * _DLIB_GLOBAL_VARIABLES 0 Use external TLS interface for the libraries global
 *                          and static variables
 *                        1 Use a lock for accesses to the locale and no 
 *                          security for accesses to other global and static
 *                          variables in the library
 * _DLIB_FILE_OP_LOCKS    0 No file-atomic locks
 *                        1 File-atomic locks

 * _DLIB_COMPILER_TLS     0 No Thread-Local-Storage support in the compiler
 *                        1 Thread-Local-Storage support in the compiler
 * _DLIB_TLS_QUAL         The TLS qualifier, define only if _COMPILER_TLS == 1
 *
 * _DLIB_THREAD_MACRO_SETUP_DONE Whether to use the standard definitions of
 *                               TLS macros defined in xtls.h or the definitions
 *                               are provided here.
 *                        0 Use default macros
 *                        1 Macros defined for xtls.h
 *
 * _DLIB_THREAD_LOCK_ONCE_TYPE
 *                        type for control variable in once-initialization of 
 *                        locks
 * _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *                        expression that will be evaluated at each lock access
 *                        to determine if an initialization must be done
 * _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *                        initial value for the control variable
 *
 ****************************************************************************
 * Description
 * -----------
 *
 * If locks are to be used (_DLIB_MULTI_THREAD != 0), the following options
 * has to be used in ilink: 
 *   --redirect __iar_Locksyslock=__iar_Locksyslock_mtx
 *   --redirect __iar_Unlocksyslock=__iar_Unlocksyslock_mtx
 *   --redirect __iar_Lockfilelock=__iar_Lockfilelock_mtx
 *   --redirect __iar_Unlockfilelock=__iar_Unlockfilelock_mtx
 *   --keep     __iar_Locksyslock_mtx
 * and, if C++ is used, also:
 *   --redirect __iar_Initdynamicfilelock=__iar_Initdynamicfilelock_mtx
 *   --redirect __iar_Dstdynamicfilelock=__iar_Dstdynamicfilelock_mtx
 *   --redirect __iar_Lockdynamicfilelock=__iar_Lockdynamicfilelock_mtx
 *   --redirect __iar_Unlockdynamicfilelock=__iar_Unlockdynamicfilelock_mtx
 * Xlink uses similar options (-e and -g). The following lock interface must
 * also be implemented: 
 *   typedef void *__iar_Rmtx;                   // Lock info object
 *
 *   void __iar_system_Mtxinit(__iar_Rmtx *);    // Initialize a system lock
 *   void __iar_system_Mtxdst(__iar_Rmtx *);     // Destroy a system lock
 *   void __iar_system_Mtxlock(__iar_Rmtx *);    // Lock a system lock
 *   void __iar_system_Mtxunlock(__iar_Rmtx *);  // Unlock a system lock
 * The interface handles locks for the heap, the locale, the file system
 * structure, the initialization of statics in functions, etc. 
 *
 * The following lock interface is optional to be implemented:
 *   void __iar_file_Mtxinit(__iar_Rmtx *);    // Initialize a file lock
 *   void __iar_file_Mtxdst(__iar_Rmtx *);     // Destroy a file lock
 *   void __iar_file_Mtxlock(__iar_Rmtx *);    // Lock a file lock
 *   void __iar_file_Mtxunlock(__iar_Rmtx *);  // Unlock a file lock
 * The interface handles locks for each file stream.
 * 
 * These three once-initialization symbols must also be defined, if the 
 * default initialization later on in this file doesn't work (done in 
 * DLib_product.h):
 *
 *   _DLIB_THREAD_LOCK_ONCE_TYPE
 *   _DLIB_THREAD_LOCK_ONCE_MACRO(control_variable, init_function)
 *   _DLIB_THREAD_LOCK_ONCE_TYPE_INIT
 *
 * If an external TLS interface is used, the following must
 * be defined:
 *   typedef int __iar_Tlskey_t;
 *   typedef void (*__iar_Tlsdtor_t)(void *);
 *   int __iar_Tlsalloc(__iar_Tlskey_t *, __iar_Tlsdtor_t); 
 *                                                    // Allocate a TLS element
 *   int __iar_Tlsfree(__iar_Tlskey_t);               // Free a TLS element
 *   int __iar_Tlsset(__iar_Tlskey_t, void *);        // Set a TLS element
 *   void *__iar_Tlsget(__iar_Tlskey_t);              // Get a TLS element
 *
 */

/* We don't have a compiler that supports tls declarations */


  /* No support for threading. */



  
  typedef void *__iar_Rmtx;
  











                /* THREAD-LOCAL STORAGE */


                /* MULTITHREAD PROPERTIES */

                /* LOCK MACROS */


                /* MISCELLANEOUS MACROS AND FUNCTIONS*/




/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */


/* Fixed size types. These are all optional. */
  typedef signed char   int8_t;
  typedef unsigned char uint8_t;

  typedef signed int   int16_t;
  typedef unsigned int uint16_t;

  typedef signed long int   int32_t;
  typedef unsigned long int uint32_t;

  #pragma language=save
  #pragma language=extended
  typedef signed long long int   int64_t;
  typedef unsigned long long int uint64_t;
  #pragma language=restore

/* Types capable of holding at least a certain number of bits.
   These are not optional for the sizes 8, 16, 32, 64. */
typedef signed char   int_least8_t;
typedef unsigned char uint_least8_t;

typedef signed int   int_least16_t;
typedef unsigned int uint_least16_t;

typedef signed long int   int_least32_t;
typedef unsigned long int uint_least32_t;

/* This isn't really optional, but make it so for now. */
  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_least64_t;
  #pragma language=restore
  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_least64_t;
  #pragma language=restore

/* The fastest type holding at least a certain number of bits.
   These are not optional for the size 8, 16, 32, 64.
   For now, the 64 bit size is optional in IAR compilers. */
typedef signed char   int_fast8_t;
typedef unsigned char uint_fast8_t;

typedef signed int   int_fast16_t;
typedef unsigned int uint_fast16_t;

typedef signed long int   int_fast32_t;
typedef unsigned long int uint_fast32_t;

  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_fast64_t;
  #pragma language=restore
  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_fast64_t;
  #pragma language=restore

/* The integer type capable of holding the largest number of bits. */
#pragma language=save
#pragma language=extended
typedef signed long long int   intmax_t;
typedef unsigned long long int uintmax_t;
#pragma language=restore

/* An integer type large enough to be able to hold a pointer.
   This is optional, but always supported in IAR compilers. */
typedef signed int   intptr_t;
typedef unsigned int uintptr_t;

/* An integer capable of holding a pointer to a specific memory type. */
typedef signed char __tiny_intptr_t; typedef unsigned char __tiny_uintptr_t; typedef short int __near_intptr_t; typedef unsigned short int __near_uintptr_t; typedef signed char __tinyflash_intptr_t; typedef unsigned char __tinyflash_uintptr_t; typedef short int __flash_intptr_t; typedef unsigned short int __flash_uintptr_t; typedef short int __eeprom_intptr_t; typedef unsigned short int __eeprom_uintptr_t; typedef signed char __io_intptr_t; typedef unsigned char __io_uintptr_t; typedef short int __ext_io_intptr_t; typedef unsigned short int __ext_io_uintptr_t; typedef short int __generic_intptr_t; typedef unsigned short int __generic_uintptr_t;

/* Minimum and maximum limits. */

























/* Macros expanding to integer constants. */











/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

  //#warning Тактовая частота процессора (F_CPU) указана! Используется значение по-умолчанию: 8 000 000 Гц

/*****************************************************************************/


/**************************************************************
 **             - IO_AVR.H -
 **
 **     I/O definitions for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 2001 - 2014 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision$
 **
 **************************************************************/

#pragma system_include

/****************************************************************************
 **             - iom8a.h -
 **
 **     This file declares the internal register addresses for ATmega8A.
 **
 **     Used with iccAVR and aAVR.
 **
 **     Copyright 2008 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10510 $
 **
 ***************************************************************************/

#pragma system_include

/**************************************************************
 **             - iomacro.h -
 **
 **     This file defines the Special Function Register Macros
 **     for Atmel AT90S.
 **
 **     Used with iccAVR and aAVR.
 **
 **     Copyright 1999 - 2005 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10063 $
 **
 **************************************************************/

#pragma system_include




/* The assembler uses a special set of macros... */



















  
  


























/*
  SFR_B(SREG,  0x3F) Expands to:
  __io union {
              unsigned char   SREG;          // The sfrb as 1 byte
              struct {                        // The sfrb as 8 bits
                      unsigned char SREG_Bit0:1,
                                    SREG_Bit1:1,
                                    SREG_Bit2:1,
                                    SREG_Bit3:1,
                                    SREG_Bit4:1,
                                    SREG_Bit5:1,
                                    SREG_Bit6:1,
                                    SREG_Bit7:1;
                     };
             } @ 0x3F;
*/

/*
  SFR_B_N(0x3F,SREG,I,T,H,S,V,N,Z,C) Expands to:
  __io union {
              unsigned char   SREG;          // The sfrb as 1 byte
              struct {                        // The sfrb as 8 bits
                      unsigned char SREG_Bit0:1,
                                    SREG_Bit1:1,
                                    SREG_Bit2:1,
                                    SREG_Bit3:1,
                                    SREG_Bit4:1,
                                    SREG_Bit5:1,
                                    SREG_Bit6:1,
                                    SREG_Bit7:1;
                     };
              struct {                        // The sfrb as 8 bits
                      unsigned char SREG_C:1,
                                    SREG_Z:1,
                                    SREG_N:1,
                                    SREG_V:1,
                                    SREG_S:1,
                                    SREG_H:1,
                                    SREG_T:1,
                                    SREG_I:1;
                     };
             } @ 0x3F;
*/












































/* SFRs are local in assembler modules (so this file may need to be */
/* included in more than one module in the same source file), */
/* but #defines must only be made once per source file. */

/*==============================*/
/* Interrupt Vector Definitions */
/*==============================*/

/* NB! vectors are specified as byte addresses */





/* Include the SFR part if this file has not been included before,
 * OR this file is included by the assembler (SFRs must be defined in
 * each assembler module). */

#pragma language=save
#pragma language=extended

/*==========================*/
/* Predefined SFR Addresses */
/*==========================*/

/****************************************************************************
 * An example showing the SFR_B() macro call, 
 * the expanded result and usage of this result:
 *
 * SFR_B(AVR,   0x1F) Expands to:
 * __io union {
 *             unsigned char AVR;                 // The sfrb as 1 byte
 *             struct {                           // The sfrb as 8 bits
 *                     unsigned char AVR_Bit0:1,
 *                                   AVR_Bit1:1,
 *                                   AVR_Bit2:1,
 *                                   AVR_Bit3:1,
 *                                   AVR_Bit4:1,
 *                                   AVR_Bit5:1,
 *                                   AVR_Bit6:1,
 *                                   AVR_Bit7:1;
 *                    };
 *            } @ 0x1F;
 * Examples of how to use the expanded result:
 * AVR |= (1<<5);
 * or like this:
 * AVR_Bit5 = 1;
 ***************************************************************************/

 __io union { unsigned char TWBR; struct { unsigned char TWBR_Bit0:1, TWBR_Bit1:1, TWBR_Bit2:1, TWBR_Bit3:1, TWBR_Bit4:1, TWBR_Bit5:1, TWBR_Bit6:1, TWBR_Bit7:1; }; } @ 0x00; /* TWI Bit rate Register */
 __io union { unsigned char TWSR; struct { unsigned char TWSR_Bit0:1, TWSR_Bit1:1, TWSR_Bit2:1, TWSR_Bit3:1, TWSR_Bit4:1, TWSR_Bit5:1, TWSR_Bit6:1, TWSR_Bit7:1; }; } @ 0X01; /* TWI status Register */
 __io union { unsigned char TWAR; struct { unsigned char TWAR_Bit0:1, TWAR_Bit1:1, TWAR_Bit2:1, TWAR_Bit3:1, TWAR_Bit4:1, TWAR_Bit5:1, TWAR_Bit6:1, TWAR_Bit7:1; }; } @ 0x02; /* TWI Address Register */
 __io union { unsigned char TWDR; struct { unsigned char TWDR_Bit0:1, TWDR_Bit1:1, TWDR_Bit2:1, TWDR_Bit3:1, TWDR_Bit4:1, TWDR_Bit5:1, TWDR_Bit6:1, TWDR_Bit7:1; }; } @ 0x03; /* TWI Data Register */
 __io union { unsigned short ADC; struct { unsigned char ADC_Bit0:1, ADC_Bit1:1, ADC_Bit2:1, ADC_Bit3:1, ADC_Bit4:1, ADC_Bit5:1, ADC_Bit6:1, ADC_Bit7:1; unsigned char ADC_Bit8:1, ADC_Bit9:1, ADC_Bit10:1, ADC_Bit11:1, ADC_Bit12:1, ADC_Bit13:1, ADC_Bit14:1, ADC_Bit15:1; }; struct { unsigned char ADCL; unsigned char ADCH; }; struct { unsigned char ADCL_Bit0:1, ADCL_Bit1:1, ADCL_Bit2:1, ADCL_Bit3:1, ADCL_Bit4:1, ADCL_Bit5:1, ADCL_Bit6:1, ADCL_Bit7:1; unsigned char ADCH_Bit0:1, ADCH_Bit1:1, ADCH_Bit2:1, ADCH_Bit3:1, ADCH_Bit4:1, ADCH_Bit5:1, ADCH_Bit6:1, ADCH_Bit7:1; }; } @ 0x04; /* ADC Data register */
 __io union { unsigned char ADCSR; struct { unsigned char ADCSR_Bit0:1, ADCSR_Bit1:1, ADCSR_Bit2:1, ADCSR_Bit3:1, ADCSR_Bit4:1, ADCSR_Bit5:1, ADCSR_Bit6:1, ADCSR_Bit7:1; }; } @ 0x06; /* ADC Control and Status Register */
 __io union { unsigned char ADMUX; struct { unsigned char ADMUX_Bit0:1, ADMUX_Bit1:1, ADMUX_Bit2:1, ADMUX_Bit3:1, ADMUX_Bit4:1, ADMUX_Bit5:1, ADMUX_Bit6:1, ADMUX_Bit7:1; }; } @ 0x07; /* ADC MUX */
 __io union { unsigned char ACSR; struct { unsigned char ACSR_Bit0:1, ACSR_Bit1:1, ACSR_Bit2:1, ACSR_Bit3:1, ACSR_Bit4:1, ACSR_Bit5:1, ACSR_Bit6:1, ACSR_Bit7:1; }; } @ 0x08; /* Analog Comparator Control and Status Register */
 __io union { unsigned char UBRRL; struct { unsigned char UBRRL_Bit0:1, UBRRL_Bit1:1, UBRRL_Bit2:1, UBRRL_Bit3:1, UBRRL_Bit4:1, UBRRL_Bit5:1, UBRRL_Bit6:1, UBRRL_Bit7:1; }; } @ 0x09; /* UART Baud Rate Register */
 __io union { unsigned char UCSRB; struct { unsigned char UCSRB_Bit0:1, UCSRB_Bit1:1, UCSRB_Bit2:1, UCSRB_Bit3:1, UCSRB_Bit4:1, UCSRB_Bit5:1, UCSRB_Bit6:1, UCSRB_Bit7:1; }; } @ 0x0A; /* UART Control and Status Register B */
 __io union { unsigned char UCSRA; struct { unsigned char UCSRA_Bit0:1, UCSRA_Bit1:1, UCSRA_Bit2:1, UCSRA_Bit3:1, UCSRA_Bit4:1, UCSRA_Bit5:1, UCSRA_Bit6:1, UCSRA_Bit7:1; }; } @ 0x0B; /* UART Control and Status Register A */
 __io union { unsigned char UDR; struct { unsigned char UDR_Bit0:1, UDR_Bit1:1, UDR_Bit2:1, UDR_Bit3:1, UDR_Bit4:1, UDR_Bit5:1, UDR_Bit6:1, UDR_Bit7:1; }; } @ 0x0C; /* UART I/O Data Register */
 __io union { unsigned char SPCR; struct { unsigned char SPCR_Bit0:1, SPCR_Bit1:1, SPCR_Bit2:1, SPCR_Bit3:1, SPCR_Bit4:1, SPCR_Bit5:1, SPCR_Bit6:1, SPCR_Bit7:1; }; } @ 0x0D; /* SPI Control Register */
 __io union { unsigned char SPSR; struct { unsigned char SPSR_Bit0:1, SPSR_Bit1:1, SPSR_Bit2:1, SPSR_Bit3:1, SPSR_Bit4:1, SPSR_Bit5:1, SPSR_Bit6:1, SPSR_Bit7:1; }; } @ 0x0E; /* SPI Status Register */
 __io union { unsigned char SPDR; struct { unsigned char SPDR_Bit0:1, SPDR_Bit1:1, SPDR_Bit2:1, SPDR_Bit3:1, SPDR_Bit4:1, SPDR_Bit5:1, SPDR_Bit6:1, SPDR_Bit7:1; }; } @ 0x0F; /* SPI I/O Data Register */
 __io union { unsigned char PIND; struct { unsigned char PIND_Bit0:1, PIND_Bit1:1, PIND_Bit2:1, PIND_Bit3:1, PIND_Bit4:1, PIND_Bit5:1, PIND_Bit6:1, PIND_Bit7:1; }; } @ 0x10; /* Input Pins, Port D */
 __io union { unsigned char DDRD; struct { unsigned char DDRD_Bit0:1, DDRD_Bit1:1, DDRD_Bit2:1, DDRD_Bit3:1, DDRD_Bit4:1, DDRD_Bit5:1, DDRD_Bit6:1, DDRD_Bit7:1; }; } @ 0x11; /* Data Direction Register, Port D */
 __io union { unsigned char PORTD; struct { unsigned char PORTD_Bit0:1, PORTD_Bit1:1, PORTD_Bit2:1, PORTD_Bit3:1, PORTD_Bit4:1, PORTD_Bit5:1, PORTD_Bit6:1, PORTD_Bit7:1; }; } @ 0x12; /* Data Register, Port D */
 __io union { unsigned char PINC; struct { unsigned char PINC_Bit0:1, PINC_Bit1:1, PINC_Bit2:1, PINC_Bit3:1, PINC_Bit4:1, PINC_Bit5:1, PINC_Bit6:1, PINC_Bit7:1; }; } @ 0x13; /* Input Pins, Port C */
 __io union { unsigned char DDRC; struct { unsigned char DDRC_Bit0:1, DDRC_Bit1:1, DDRC_Bit2:1, DDRC_Bit3:1, DDRC_Bit4:1, DDRC_Bit5:1, DDRC_Bit6:1, DDRC_Bit7:1; }; } @ 0x14; /* Data Direction Register, Port C */
 __io union { unsigned char PORTC; struct { unsigned char PORTC_Bit0:1, PORTC_Bit1:1, PORTC_Bit2:1, PORTC_Bit3:1, PORTC_Bit4:1, PORTC_Bit5:1, PORTC_Bit6:1, PORTC_Bit7:1; }; } @ 0x15; /* Data Register, Port C */
 __io union { unsigned char PINB; struct { unsigned char PINB_Bit0:1, PINB_Bit1:1, PINB_Bit2:1, PINB_Bit3:1, PINB_Bit4:1, PINB_Bit5:1, PINB_Bit6:1, PINB_Bit7:1; }; } @ 0x16; /* Input Pins, Port B */
 __io union { unsigned char DDRB; struct { unsigned char DDRB_Bit0:1, DDRB_Bit1:1, DDRB_Bit2:1, DDRB_Bit3:1, DDRB_Bit4:1, DDRB_Bit5:1, DDRB_Bit6:1, DDRB_Bit7:1; }; } @ 0x17; /* Data Direction Register, Port B */
 __io union { unsigned char PORTB; struct { unsigned char PORTB_Bit0:1, PORTB_Bit1:1, PORTB_Bit2:1, PORTB_Bit3:1, PORTB_Bit4:1, PORTB_Bit5:1, PORTB_Bit6:1, PORTB_Bit7:1; }; } @ 0x18; /* Data Register, Port B */



 __io union { unsigned char EECR; struct { unsigned char EECR_Bit0:1, EECR_Bit1:1, EECR_Bit2:1, EECR_Bit3:1, EECR_Bit4:1, EECR_Bit5:1, EECR_Bit6:1, EECR_Bit7:1; }; } @ 0x1C; /* EEPROM Control Register */
 __io union { unsigned char EEDR; struct { unsigned char EEDR_Bit0:1, EEDR_Bit1:1, EEDR_Bit2:1, EEDR_Bit3:1, EEDR_Bit4:1, EEDR_Bit5:1, EEDR_Bit6:1, EEDR_Bit7:1; }; } @ 0x1D; /* EEPROM Data Register */
 __io union { unsigned short EEAR; struct { unsigned char EEAR_Bit0:1, EEAR_Bit1:1, EEAR_Bit2:1, EEAR_Bit3:1, EEAR_Bit4:1, EEAR_Bit5:1, EEAR_Bit6:1, EEAR_Bit7:1; unsigned char EEAR_Bit8:1, EEAR_Bit9:1, EEAR_Bit10:1, EEAR_Bit11:1, EEAR_Bit12:1, EEAR_Bit13:1, EEAR_Bit14:1, EEAR_Bit15:1; }; struct { unsigned char EEARL; unsigned char EEARH; }; struct { unsigned char EEARL_Bit0:1, EEARL_Bit1:1, EEARL_Bit2:1, EEARL_Bit3:1, EEARL_Bit4:1, EEARL_Bit5:1, EEARL_Bit6:1, EEARL_Bit7:1; unsigned char EEARH_Bit0:1, EEARH_Bit1:1, EEARH_Bit2:1, EEARH_Bit3:1, EEARH_Bit4:1, EEARH_Bit5:1, EEARH_Bit6:1, EEARH_Bit7:1; }; } @ 0x1E; /* EEPROM Address Register */
 __io union { unsigned char UBRRH; unsigned char UCSRC; struct { unsigned char UBRRH_Bit0:1, UBRRH_Bit1:1, UBRRH_Bit2:1, UBRRH_Bit3:1, UBRRH_Bit4:1, UBRRH_Bit5:1, UBRRH_Bit6:1, UBRRH_Bit7:1; }; struct { unsigned char UCSRC_Bit0:1, UCSRC_Bit1:1, UCSRC_Bit2:1, UCSRC_Bit3:1, UCSRC_Bit4:1, UCSRC_Bit5:1, UCSRC_Bit6:1, UCSRC_Bit7:1; }; } @ 0x20;  
/* UART Baud Rate Register HI */
/* UART Control Register C */
 __io union { unsigned char WDTCR; struct { unsigned char WDTCR_Bit0:1, WDTCR_Bit1:1, WDTCR_Bit2:1, WDTCR_Bit3:1, WDTCR_Bit4:1, WDTCR_Bit5:1, WDTCR_Bit6:1, WDTCR_Bit7:1; }; } @ 0x21; /* Watchdog Timer Control Register */
 __io union { unsigned char ASSR; struct { unsigned char ASSR_Bit0:1, ASSR_Bit1:1, ASSR_Bit2:1, ASSR_Bit3:1, ASSR_Bit4:1, ASSR_Bit5:1, ASSR_Bit6:1, ASSR_Bit7:1; }; } @ 0x22; /* ASynchronous mode Status Register */
 __io union { unsigned char OCR2; struct { unsigned char OCR2_Bit0:1, OCR2_Bit1:1, OCR2_Bit2:1, OCR2_Bit3:1, OCR2_Bit4:1, OCR2_Bit5:1, OCR2_Bit6:1, OCR2_Bit7:1; }; } @ 0x23; /* Timer/Counter2 Output Compare Register */
 __io union { unsigned char TCNT2; struct { unsigned char TCNT2_Bit0:1, TCNT2_Bit1:1, TCNT2_Bit2:1, TCNT2_Bit3:1, TCNT2_Bit4:1, TCNT2_Bit5:1, TCNT2_Bit6:1, TCNT2_Bit7:1; }; } @ 0x24; /* Timer/Counter 2 */
 __io union { unsigned char TCCR2; struct { unsigned char TCCR2_Bit0:1, TCCR2_Bit1:1, TCCR2_Bit2:1, TCCR2_Bit3:1, TCCR2_Bit4:1, TCCR2_Bit5:1, TCCR2_Bit6:1, TCCR2_Bit7:1; }; } @ 0x25; /* Timer/Counter 2 Control Register */
 __io union { unsigned short ICR1; struct { unsigned char ICR1_Bit0:1, ICR1_Bit1:1, ICR1_Bit2:1, ICR1_Bit3:1, ICR1_Bit4:1, ICR1_Bit5:1, ICR1_Bit6:1, ICR1_Bit7:1; unsigned char ICR1_Bit8:1, ICR1_Bit9:1, ICR1_Bit10:1, ICR1_Bit11:1, ICR1_Bit12:1, ICR1_Bit13:1, ICR1_Bit14:1, ICR1_Bit15:1; }; struct { unsigned char ICR1L; unsigned char ICR1H; }; struct { unsigned char ICR1L_Bit0:1, ICR1L_Bit1:1, ICR1L_Bit2:1, ICR1L_Bit3:1, ICR1L_Bit4:1, ICR1L_Bit5:1, ICR1L_Bit6:1, ICR1L_Bit7:1; unsigned char ICR1H_Bit0:1, ICR1H_Bit1:1, ICR1H_Bit2:1, ICR1H_Bit3:1, ICR1H_Bit4:1, ICR1H_Bit5:1, ICR1H_Bit6:1, ICR1H_Bit7:1; }; } @ 0x26; /* T/C 1 Input Capture Register */
 __io union { unsigned short OCR1B; struct { unsigned char OCR1B_Bit0:1, OCR1B_Bit1:1, OCR1B_Bit2:1, OCR1B_Bit3:1, OCR1B_Bit4:1, OCR1B_Bit5:1, OCR1B_Bit6:1, OCR1B_Bit7:1; unsigned char OCR1B_Bit8:1, OCR1B_Bit9:1, OCR1B_Bit10:1, OCR1B_Bit11:1, OCR1B_Bit12:1, OCR1B_Bit13:1, OCR1B_Bit14:1, OCR1B_Bit15:1; }; struct { unsigned char OCR1BL; unsigned char OCR1BH; }; struct { unsigned char OCR1BL_Bit0:1, OCR1BL_Bit1:1, OCR1BL_Bit2:1, OCR1BL_Bit3:1, OCR1BL_Bit4:1, OCR1BL_Bit5:1, OCR1BL_Bit6:1, OCR1BL_Bit7:1; unsigned char OCR1BH_Bit0:1, OCR1BH_Bit1:1, OCR1BH_Bit2:1, OCR1BH_Bit3:1, OCR1BH_Bit4:1, OCR1BH_Bit5:1, OCR1BH_Bit6:1, OCR1BH_Bit7:1; }; } @ 0x28; /* Timer/Counter1 Output Compare Register B */
 __io union { unsigned short OCR1A; struct { unsigned char OCR1A_Bit0:1, OCR1A_Bit1:1, OCR1A_Bit2:1, OCR1A_Bit3:1, OCR1A_Bit4:1, OCR1A_Bit5:1, OCR1A_Bit6:1, OCR1A_Bit7:1; unsigned char OCR1A_Bit8:1, OCR1A_Bit9:1, OCR1A_Bit10:1, OCR1A_Bit11:1, OCR1A_Bit12:1, OCR1A_Bit13:1, OCR1A_Bit14:1, OCR1A_Bit15:1; }; struct { unsigned char OCR1AL; unsigned char OCR1AH; }; struct { unsigned char OCR1AL_Bit0:1, OCR1AL_Bit1:1, OCR1AL_Bit2:1, OCR1AL_Bit3:1, OCR1AL_Bit4:1, OCR1AL_Bit5:1, OCR1AL_Bit6:1, OCR1AL_Bit7:1; unsigned char OCR1AH_Bit0:1, OCR1AH_Bit1:1, OCR1AH_Bit2:1, OCR1AH_Bit3:1, OCR1AH_Bit4:1, OCR1AH_Bit5:1, OCR1AH_Bit6:1, OCR1AH_Bit7:1; }; } @ 0x2A; /* Timer/Counter1 Output Compare Register A */
 __io union { unsigned short TCNT1; struct { unsigned char TCNT1_Bit0:1, TCNT1_Bit1:1, TCNT1_Bit2:1, TCNT1_Bit3:1, TCNT1_Bit4:1, TCNT1_Bit5:1, TCNT1_Bit6:1, TCNT1_Bit7:1; unsigned char TCNT1_Bit8:1, TCNT1_Bit9:1, TCNT1_Bit10:1, TCNT1_Bit11:1, TCNT1_Bit12:1, TCNT1_Bit13:1, TCNT1_Bit14:1, TCNT1_Bit15:1; }; struct { unsigned char TCNT1L; unsigned char TCNT1H; }; struct { unsigned char TCNT1L_Bit0:1, TCNT1L_Bit1:1, TCNT1L_Bit2:1, TCNT1L_Bit3:1, TCNT1L_Bit4:1, TCNT1L_Bit5:1, TCNT1L_Bit6:1, TCNT1L_Bit7:1; unsigned char TCNT1H_Bit0:1, TCNT1H_Bit1:1, TCNT1H_Bit2:1, TCNT1H_Bit3:1, TCNT1H_Bit4:1, TCNT1H_Bit5:1, TCNT1H_Bit6:1, TCNT1H_Bit7:1; }; } @ 0x2C; /* Timer/Counter 1 */
 __io union { unsigned char TCCR1B; struct { unsigned char TCCR1B_Bit0:1, TCCR1B_Bit1:1, TCCR1B_Bit2:1, TCCR1B_Bit3:1, TCCR1B_Bit4:1, TCCR1B_Bit5:1, TCCR1B_Bit6:1, TCCR1B_Bit7:1; }; } @ 0x2E; /* Timer/Counter 1 Control and Status Register */
 __io union { unsigned char TCCR1A; struct { unsigned char TCCR1A_Bit0:1, TCCR1A_Bit1:1, TCCR1A_Bit2:1, TCCR1A_Bit3:1, TCCR1A_Bit4:1, TCCR1A_Bit5:1, TCCR1A_Bit6:1, TCCR1A_Bit7:1; }; } @ 0x2F; /* Timer/Counter 1 Control Register */
 __io union { unsigned char SFIOR; struct { unsigned char SFIOR_Bit0:1, SFIOR_Bit1:1, SFIOR_Bit2:1, SFIOR_Bit3:1, SFIOR_Bit4:1, SFIOR_Bit5:1, SFIOR_Bit6:1, SFIOR_Bit7:1; }; } @ 0x30; /* Special Function I/O Register */
 __io union { unsigned char OSCCAL; struct { unsigned char OSCCAL_Bit0:1, OSCCAL_Bit1:1, OSCCAL_Bit2:1, OSCCAL_Bit3:1, OSCCAL_Bit4:1, OSCCAL_Bit5:1, OSCCAL_Bit6:1, OSCCAL_Bit7:1; }; } @ 0x31; /* OSCillator CALibration Register */
 __io union { unsigned char TCNT0; struct { unsigned char TCNT0_Bit0:1, TCNT0_Bit1:1, TCNT0_Bit2:1, TCNT0_Bit3:1, TCNT0_Bit4:1, TCNT0_Bit5:1, TCNT0_Bit6:1, TCNT0_Bit7:1; }; } @ 0x32; /* Timer/Counter 0 */
 __io union { unsigned char TCCR0; struct { unsigned char TCCR0_Bit0:1, TCCR0_Bit1:1, TCCR0_Bit2:1, TCCR0_Bit3:1, TCCR0_Bit4:1, TCCR0_Bit5:1, TCCR0_Bit6:1, TCCR0_Bit7:1; }; } @ 0x33; /* Timer/Counter 0 Control Register */
 __io union { unsigned char MCUCSR; struct { unsigned char MCUCSR_Bit0:1, MCUCSR_Bit1:1, MCUCSR_Bit2:1, MCUCSR_Bit3:1, MCUCSR_Bit4:1, MCUCSR_Bit5:1, MCUCSR_Bit6:1, MCUCSR_Bit7:1; }; } @ 0x34; /* MCU general Control/Status Register */
 __io union { unsigned char MCUCR; struct { unsigned char MCUCR_Bit0:1, MCUCR_Bit1:1, MCUCR_Bit2:1, MCUCR_Bit3:1, MCUCR_Bit4:1, MCUCR_Bit5:1, MCUCR_Bit6:1, MCUCR_Bit7:1; }; } @ 0x35; /* MCU general Control Register */
 __io union { unsigned char TWCR; struct { unsigned char TWCR_Bit0:1, TWCR_Bit1:1, TWCR_Bit2:1, TWCR_Bit3:1, TWCR_Bit4:1, TWCR_Bit5:1, TWCR_Bit6:1, TWCR_Bit7:1; }; } @ 0x36; /* TWI Control Register */
 __io union { unsigned char SPMCR; struct { unsigned char SPMCR_Bit0:1, SPMCR_Bit1:1, SPMCR_Bit2:1, SPMCR_Bit3:1, SPMCR_Bit4:1, SPMCR_Bit5:1, SPMCR_Bit6:1, SPMCR_Bit7:1; }; } @ 0x37; /* SPM Control Register */
 __io union { unsigned char TIFR; struct { unsigned char TIFR_Bit0:1, TIFR_Bit1:1, TIFR_Bit2:1, TIFR_Bit3:1, TIFR_Bit4:1, TIFR_Bit5:1, TIFR_Bit6:1, TIFR_Bit7:1; }; } @ 0x38; /* Timer/Counter Interrupt Flag register */
 __io union { unsigned char TIMSK; struct { unsigned char TIMSK_Bit0:1, TIMSK_Bit1:1, TIMSK_Bit2:1, TIMSK_Bit3:1, TIMSK_Bit4:1, TIMSK_Bit5:1, TIMSK_Bit6:1, TIMSK_Bit7:1; }; } @ 0x39; /* Timer/Counter Interrupt MaSK register */
 __io union { unsigned char GIFR; struct { unsigned char GIFR_Bit0:1, GIFR_Bit1:1, GIFR_Bit2:1, GIFR_Bit3:1, GIFR_Bit4:1, GIFR_Bit5:1, GIFR_Bit6:1, GIFR_Bit7:1; }; } @ 0x3A; /* General Interrupt Flag Register */
 __io union { unsigned char GICR; struct { unsigned char GICR_Bit0:1, GICR_Bit1:1, GICR_Bit2:1, GICR_Bit3:1, GICR_Bit4:1, GICR_Bit5:1, GICR_Bit6:1, GICR_Bit7:1; }; } @ 0x3B; /* General Interrupt Control register */

 __io union { unsigned short SP; struct { unsigned char SP_Bit0:1, SP_Bit1:1, SP_Bit2:1, SP_Bit3:1, SP_Bit4:1, SP_Bit5:1, SP_Bit6:1, SP_Bit7:1; unsigned char SP_Bit8:1, SP_Bit9:1, SP_Bit10:1, SP_Bit11:1, SP_Bit12:1, SP_Bit13:1, SP_Bit14:1, SP_Bit15:1; }; struct { unsigned char SPL; unsigned char SPH; }; struct { unsigned char SPL_Bit0:1, SPL_Bit1:1, SPL_Bit2:1, SPL_Bit3:1, SPL_Bit4:1, SPL_Bit5:1, SPL_Bit6:1, SPL_Bit7:1; unsigned char SPH_Bit0:1, SPH_Bit1:1, SPH_Bit2:1, SPH_Bit3:1, SPH_Bit4:1, SPH_Bit5:1, SPH_Bit6:1, SPH_Bit7:1; }; } @ 0x3D; /* Stack Pointer */
 __io union { unsigned char SREG; struct { unsigned char SREG_Bit0:1, SREG_Bit1:1, SREG_Bit2:1, SREG_Bit3:1, SREG_Bit4:1, SREG_Bit5:1, SREG_Bit6:1, SREG_Bit7:1; }; } @ 0x3F; /* Status REGister */

#pragma language=restore


/* Bit definitions for use with the IAR Assembler   
   The Register Bit names are represented by their bit number (0-7).
*/
 
/* General Interrupt Control register */

 
/* General Interrupt Flag Register */
 
/* Timer/Counter Interrupt MaSK register */

 
/* Timer/Counter Interrupt Flag register */


/* SPM Control Register */			


/* TWI Control Register */


/* MCU general Control Register */

/* MCU general Control and Status Register */

 
/* Timer/Counter 0 Control Register */
  
/* Special Function I/O Register */		


/* Timer/Counter 1A Control Register */
 
/* Timer/Counter 1B Control Register */

 
/* Timer/Counter 2 Control Register */
 
/* Asynchronous mode Status Register */

                        
/* Watchdog Timer Control Register */

 
/* UART UBRRH and UCSRC */

/* EEPROM Control Register */

 
/* Data Register, Port B */
 
 /* Data Register, Port B */
 
/* Data Direction Register, Port B */
 
/* Input Pins, Port B */
 
/* Data Register, Port C */

 
  /* Data Register, Port C */

 
/* Data Direction Register, Port C */

 
/* Input Pins, Port C */

 
/* Data Register, Port D */
 
  /* Data Register, Port D */
 
/* Data Direction Register, Port D */
 
/* Input Pins, Port D */
  
/* SPI Status Register */






/* SPI Control Register */

/* UART Control and Status Register A */
 
/* UART Control and Status Register B */
 
/* Analog Comparator Control and Status Register */
 
/* ADC MUX */

 
/* ADC Control and Status Register */
 
/* TWI Address Register */


/* TWI status register */

 
/* Pointer definition   */
 
/* Constants */
 


/**************************************************************
 **             - INAVR.H -
 **
 **     Intrinsics for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 6699 $
 **
 **************************************************************/

#pragma system_include

/**************************************************************
 **             - INTRINSICS.H -
 **
 **     Intrinsics for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999-2005 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10182 $
 **
 **************************************************************/

#pragma system_include



__intrinsic void __no_operation(void);
__intrinsic void __enable_interrupt(void);
__intrinsic void __disable_interrupt(void);
__intrinsic void __sleep(void);
__intrinsic void __watchdog_reset(void);

#pragma language=save
#pragma language=extended

__intrinsic unsigned char __load_program_memory(const unsigned char __flash *);

#pragma language=restore

__intrinsic void __insert_opcode(unsigned short op);



__intrinsic void __require(void *);

__intrinsic void __delay_cycles(unsigned long);

__intrinsic unsigned char __save_interrupt(void);

__intrinsic void          __restore_interrupt(unsigned char);
typedef unsigned char __istate_t;

__intrinsic unsigned char __swap_nibbles(unsigned char);

__intrinsic void          __indirect_jump_to(unsigned long);


__intrinsic unsigned int  __multiply_unsigned(unsigned char, unsigned char);
__intrinsic signed int    __multiply_signed(signed char, signed char);
__intrinsic signed int    __multiply_signed_with_unsigned(signed char, unsigned char);

__intrinsic unsigned int  __fractional_multiply_unsigned(unsigned char, unsigned char);
__intrinsic signed int    __fractional_multiply_signed(signed char, signed char);
__intrinsic signed int    __fractional_multiply_signed_with_unsigned(signed char, signed char);

#pragma language=save
#pragma language=extended

/* SPM */

/*
  __DataToR0ByteToSPMCR_SPM, pseudo code.
  MOV   R0,data
  OUT   SPMCR,byte
  SPM
*/
__intrinsic void __DataToR0ByteToSPMCR_SPM(unsigned char data, 
                                           unsigned char byte);

/*
  __AddrToZByteToSPMCR_SPM, pseudo code.
  MOVW  R31:R30,addr
  OUT   SPMCR,byte
  SPM
*/
__intrinsic void __AddrToZByteToSPMCR_SPM(void __flash* addr, 
                                          unsigned char byte);

/*
  __AddrToZWordToR1R0ByteToSPMCR_SPM, pseudo code.
  MOVW  R31:R30,addr
  MOVW  R1:R0,word
  OUT   SPMCR,byte
  SPM
*/
__intrinsic void __AddrToZWordToR1R0ByteToSPMCR_SPM(void __flash* addr, 
                                                    unsigned short word, 
                                                    unsigned char byte);






/*
  __AddrToZByteToSPMCR_LPM, pseudo code.
  MOVW  R31:R30,addr
  OUT   SPMCR,byte
  LPM
*/
__intrinsic unsigned char __AddrToZByteToSPMCR_LPM(void __flash* addr, 
                                                   unsigned char byte);







#pragma language=restore


/* Include a file appropriate for the processor used, 
 * that defines EECR, EEAR and EEDR (e.g. io2312.h). */

/* PORT is a sfrb defined variable */






/* Nice to have macros */






/* The intrinsics for iccAVR has been moved to intrinsics.h */
/**************************************************************
 **             - INTRINSICS.H -
 **
 **     Intrinsics for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999-2005 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10182 $
 **
 **************************************************************/

#pragma system_include







/*****************************************************************************/


/*****************************************************************************/


/*****************************************************************************/





/*******************************************************************************
*  File........: macros.h
*  Author(s)...: mmavka
*  Target(s)...: AVR
*  Compiler....: Any
*  Description.: 
*  Revisions...: 
*  02.08.2013 - VER. - COMMENT                                        - SIGN.
*******************************************************************************/

//макросы для автоматического определения параметров




/***********************************************************
//BITS MACROS
//PASHGAN 2009
//CHIPENABLE.RU
//
//reg : имя переменной, регистра
//bit : позиция бита
//val : 0 или 1
************************************************************/

//пример: clr_bir(PORTB, 1); //сбросить 1-й бит PORTB

//пример: set_bit(PORTB, 3); //установить 3-й бит PORTB

//пример: set_bit_val(PORTB, 3, 1); //установить 3-й бит PORTB
//	  set_bit_val(PORTB, 2, 0); //сбросить 2-й бит PORTB

//пример: if (bit_is_clr(PORTB,1)) {...} //если бит очищен

//пример: if(bit_is_set(PORTB,2)) {...} //если бит установлен

//пример: inv_bit(PORTB, 1); //инвертировать 1-й бит PORTB


                                    
////////////////////////////////////////////////////////////////////////////////////////////////////
//	Макроопределения.
//
//  (C) Евгений Трифонов, Денис Железняков. 2001 - 2007 г.
//	Версия: 2.7.1 от 18.12.2007
////////////////////////////////////////////////////////////////////////////////////////////////////


// Параметры генератора (частота генератора указывается в Гц.)

//

//

//
/**************************************************************
 **             - IO_AVR.H -
 **
 **     I/O definitions for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 2001 - 2014 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision$
 **
 **************************************************************/

#pragma system_include

/****************************************************************************
 **             - iom8a.h -
 **
 **     This file declares the internal register addresses for ATmega8A.
 **
 **     Used with iccAVR and aAVR.
 **
 **     Copyright 2008 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10510 $
 **
 ***************************************************************************/

#pragma system_include

/**************************************************************
 **             - iomacro.h -
 **
 **     This file defines the Special Function Register Macros
 **     for Atmel AT90S.
 **
 **     Used with iccAVR and aAVR.
 **
 **     Copyright 1999 - 2005 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10063 $
 **
 **************************************************************/

#pragma system_include





/* Include the SFR part if this file has not been included before,
 * OR this file is included by the assembler (SFRs must be defined in
 * each assembler module). */
/**************************************************************
 **             - ina90.h -
 **
 **     Intrinsics for iccAVR. Compatibility file for icca90 users.
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 6699 $
 **
 **************************************************************/

#pragma system_include

/**************************************************************
 **             - INAVR.H -
 **
 **     Intrinsics for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 6699 $
 **
 **************************************************************/

#pragma system_include

/**************************************************************
 **             - INTRINSICS.H -
 **
 **     Intrinsics for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999-2005 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 10182 $
 **
 **************************************************************/

#pragma system_include

/* The intrinsics for iccAVR has been moved to intrinsics.h */
/**************************************************************
 **             - INAVR.H -
 **
 **     Backwards compatibility macros for iccAVR
 **
 **     Used with iccAVR.
 **
 **     Copyright 1999 IAR Systems AB. All rights reserved.
 **
 **     File version: $Revision: 6699 $
 **
 **************************************************************/

#pragma system_include






















// Циклы

// Задержка

// Таймеры

// Битовые операции

// Изменение состояния обного бита в переменной или регистре
//
//  Примеры:
//      Set_Bit(TCCR1A, WGM10);       - установка бита WGM10 в регистре TCCR1A
//      Clear_Bit(TCCR1B, CS10);      - сброс бита CS10 в регистре TCCR1B
//      Get_Bit(TCCR1A, WGM10);       - получение значения бита WGM10 в регистре TCCR1A
//      Invert_Bit(TCCR1B, CS10);     - инвертирование бита CS10 в регистре TCCR1B
//      Is_Bit_Set(TCCR1A, WGM10);    - возвращает истину если бит WGM10 в регистре TCCR1A установлен
//      Is_Bit_Clear(TCCR1B, CS10);   - возвращает истину если бит CS10 в регистре TCCR1B сброшен
//

// Изменение состояния переменной или регистра по указанной маске
//
//  Примеры:
//      Set_Bits(TCCR1A, _Bit(WGM10) | _Bit(COM1A1));      - установка битов WGM10 и COM1A1 в регистре TCCR1A
//      Set_Bits(TCCR1A, ~_Bit(WGM10) | _Bit(COM1A1));     - сброс бита WGM10 и установка бита COM1A1 в регистре TCCR1A
//      Clear_Bits(TCCR1A, ~_Bit(WGM10) | _Bit(COM1A1));   - установка бита WGM10 и сброс бита COM1A1 в регистре TCCR1A
//

// Изменение состояния обного бита в переменной или регистре посредством определённых флагов (шаблонов)
//
//  Примеры:
//      volatile Byte System_Status = 0x00;       - объявление переменной, где будут меняться флаги
//
//      #define Error_Flag    System_Status, 0    - объявление флага в переменной System_Status в бите 0
//      #define Ready_Flag    System_Status, 1    - объявление флага в переменной System_Status в бите 1
//      #define Delay_Flag    System_Status, 3    - объявление флага в переменной System_Status в бите 3
//      #define RX_Flag       System_Status, 6    - объявление флага в переменной System_Status в бите 6
//      #define TX_Flag       System_Status, 8    - объявление флага в переменной System_Status в бите 8
//
//      Set_Flag(Ready_Flag);         - установка бита 1 в переменной System_Status
//      Set_Flag(RX_Flag);            - установка бита 6 в переменной System_Status
//      Clear_Flag(TX_Flag);          - сброс бита 8 в переменной System_Status
//

//

// Скорость порта UART

// Переименование типов

/* stdbool.h header */
/* Copyright 2003-2010 IAR Systems AB.  */

/* NOTE: IAR Extensions must be enabled in order to use the bool type! */


  #pragma system_include







/*
 * Copyright (c) 1992-2009 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.04:0576 */

// Булевый тип
typedef _Bool                  Boolean;

// Целый тип, 8 бит
typedef unsigned char				  Byte;
typedef unsigned char				  u08;
typedef signed char				    ShortInt;
typedef signed char				    s08;
typedef signed char				    SByte;

// Целый тип, 16 бит
typedef unsigned int				  Word;
typedef unsigned int				  u16;
typedef unsigned int          UInt16;
typedef signed int            SmallInt;
typedef signed int            s16;
typedef signed int            SInt16;

// Целый тип, 32 бита
typedef unsigned long				  DWord;
typedef unsigned long				  Cardinal;
typedef unsigned long				  u32;
typedef unsigned long         UInt32;
typedef signed long				    Integer;
typedef signed long				    s32;
typedef signed long           SInt32;

// Целый тип, 64 бита
typedef unsigned long long    DDWord;
typedef unsigned long	long	  u64;
typedef unsigned long long    UInt64;
typedef signed long long	    Int64;
typedef signed long	long	    s64;
typedef signed long	long	    SInt64;

// Вещественный тип, 32 бита
typedef float                 Float;

//Вещественный тип, 32 бита (если разрешено в настройках, то 64 бита)
typedef double                Double;
typedef long double           Extended;

//
typedef union
{
	unsigned char Byte;
	struct
	{
		unsigned char
			Bit0: 1,
			Bit1: 1,
			Bit2: 1,
			Bit3: 1,
			Bit4: 1,
			Bit5: 1,
			Bit6: 1,
			Bit7: 1;
	};
} Byte_Bit;

//
typedef union
{
	unsigned int Word;
	struct
	{
		unsigned char Byte0;
		unsigned char Byte1;
	};
	struct
	{
		unsigned int
			Bit0:  1,
			Bit1:  1,
			Bit2:  1,
			Bit3:  1,
			Bit4:  1,
			Bit5:  1,
			Bit6:  1,
			Bit7:  1,
			Bit8:  1,
			Bit9:  1,
			Bit10: 1,
			Bit11: 1,
			Bit12: 1,
			Bit13: 1,
			Bit14: 1,
			Bit15: 1;
	};
} Word_Byte_Bit;

//
typedef union
{
  unsigned int Word;
  struct
  {
		unsigned char Byte0;
		unsigned char Byte1;
	};
} Word_Byte;

//
typedef union
{
  unsigned long DWord;
  struct
  {
		unsigned char Byte0;
		unsigned char Byte1;
		unsigned char Byte2;
		unsigned char Byte3;
	};
} DWord_Byte;

//
typedef union
{
  unsigned long DWord;
  struct
  {
		unsigned char Byte0;
		unsigned char Byte1;
		unsigned char Byte2;
		unsigned char Byte3;
	};
  struct
  {
    unsigned long
			Bit0:  1,
			Bit1:  1,
			Bit2:  1,
			Bit3:  1,
			Bit4:  1,
			Bit5:  1,
			Bit6:  1,
			Bit7:  1,
			Bit8:  1,
			Bit9:  1,
			Bit10: 1,
			Bit11: 1,
			Bit12: 1,
			Bit13: 1,
			Bit14: 1,
			Bit15: 1,
			Bit16: 1,
			Bit17: 1,
			Bit18: 1,
			Bit19: 1,
			Bit20: 1,
			Bit21: 1,
			Bit22: 1,
			Bit23: 1,
			Bit24: 1,
			Bit25: 1,
			Bit26: 1,
			Bit27: 1,
			Bit28: 1,
			Bit29: 1,
			Bit30: 1,
			Bit31: 1;
	};
} DWord_Byte_Bit;

//
typedef union
{
  unsigned long long DDWord;
  struct
  {
		unsigned int Word0;
		unsigned int Word1;
		unsigned int Word2;
		unsigned int Word3;
	};
  struct
  {
    unsigned char Byte0;
    unsigned char Byte1;
    unsigned char Byte2;
    unsigned char Byte3;
    unsigned char Byte4;
    unsigned char Byte5;
		unsigned char Byte6;
		unsigned char Byte7;
	};
} DDWord_Byte;

//
typedef union
{
  unsigned long long DDWord;
  struct
  {
		unsigned int Word0;
		unsigned int Word1;
		unsigned int Word2;
		unsigned int Word3;
	};
  struct
  {
    unsigned char Byte0;
    unsigned char Byte1;
    unsigned char Byte2;
    unsigned char Byte3;
    unsigned char Byte4;
    unsigned char Byte5;
		unsigned char Byte6;
		unsigned char Byte7;
	};
  struct
  {
    unsigned long
			Bit0:  1,
			Bit1:  1,
			Bit2:  1,
			Bit3:  1,
			Bit4:  1,
			Bit5:  1,
			Bit6:  1,
			Bit7:  1,
			Bit8:  1,
			Bit9:  1,
			Bit10: 1,
			Bit11: 1,
			Bit12: 1,
			Bit13: 1,
			Bit14: 1,
			Bit15: 1,
			Bit16: 1,
			Bit17: 1,
			Bit18: 1,
			Bit19: 1,
			Bit20: 1,
			Bit21: 1,
			Bit22: 1,
			Bit23: 1,
			Bit24: 1,
			Bit25: 1,
			Bit26: 1,
			Bit27: 1,
			Bit28: 1,
			Bit29: 1,
			Bit30: 1,
			Bit31: 1,
			Bit32: 1,
			Bit33: 1,
			Bit34: 1,
			Bit35: 1,
			Bit36: 1,
			Bit37: 1,
			Bit38: 1,
			Bit39: 1,
			Bit40: 1,
			Bit41: 1,
			Bit42: 1,
			Bit43: 1,
			Bit44: 1,
			Bit45: 1,
			Bit46: 1,
			Bit47: 1,
			Bit48: 1,
			Bit49: 1,
			Bit50: 1,
			Bit51: 1,
			Bit52: 1,
			Bit53: 1,
			Bit54: 1,
			Bit55: 1,
			Bit56: 1,
			Bit57: 1,
			Bit58: 1,
			Bit59: 1,
			Bit60: 1,
			Bit61: 1,
			Bit62: 1,
			Bit63: 1;
	};
} DDWord_Byte_Bit;


////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Операции с портами.
//
//  Синтаксис:
//      #define <имя>   <Letter>, <Idx>, [<Level>], [<PullUp>]
//
//      <Letter>  - Буква порта (A, B, C, и т. д.).
//      <Idx>     - Номер вывода порта (0-7).
//      <Level>   - Активный уровень. (High или Low, если не указан, то High);
//                    High - логическая единица;
//                    Low  - логический ноль.
//      <PullUp>  - Внешний подтягивающий резистор. (On или Off, если не указан, то Off);
//                    On  - используется внешний подтягивающий резистор;
//                    Off - внешнего подтягивающего резастора нет.
//
//  Описание макрокоманд:
//      Pin_HiZ (Set_Pin_HiZ)             - если PullUp = Off, то вывода порта устанавливается в "третье" (Hi-Z) состояние;
//      Pin_PullUp_IO (Set_Pin_PullUp_IO) - установка вывода порта для работы с внешним "подтягивающим" резистором;
//      Pin_In (Set_Pin_In)               - установка вывода порта как вход; (Z-состояние. ВысокоОмный вход)
//      Pin_In_PullUp(Set_Pin_In_PullUp)  - установка вывода порта как вход; (Подтяжка - pull-up. Вывод как бы подсоединен к питанию МК через резистор 40 КОм)
//      Pin_Out (Set_Pin_Out)             - установка вывода порта как выход;
//      Pin_On (Set_Pin_On)               - установка активного логического уровня на выводе порта;
//      Pin_High (Set_Pin_High)           - установка "единичного" логического уровня на выводе порта;
//      Pin_Off (Set_Pin_Off)             - установка неактивного логического уровня на выводе порта;
//      Pin_Low (Set_Pin_Low)             - установка "нулевого" логического уровня на выводе порта;
//      Pin_Signal (Get_Pin_Signal)       - проверка логического уровня на выводе порта;
//      Pin_State (Get_Pin_State)         - проверка логического уровня на выводе порта;
//      Pin_Change (Change_Pin_Signal)    - изменение логического уровня на выводе порта на противоположное;
//      Pin_Invert (Invert_Pin_Signal)    - аналогично Pin_Change;
//      Pin_Out_On (Set_Pin_Out_On)       - установка вывода порта как выход и установка активного логического уровня;
//      Pin_Out_Off (Set_Pin_Out_Off)     - установка вывода порта как выход и установка неактивного логического уровня;
//      Pin_Out_High (Set_Pin_Out_High)   - установка вывода порта как выход и установка единичного логического уровня на выводе порта;
//      Pin_Out_Low (Set_Pin_Out_Low)     - установка вывода порта как выход и установка нулевого логического уровня на выводе порта.
//      Pin_SetVal (Set_Pin, Val)         - Установка вывода порта как бит
//      Pin_ClrVal (Clr_Pin, Val)         - Сброс вывода порта как бит
//      Pin_Is_Clear
//      Pin_Is_Set
//      Pin_Is_Off
//      Pin_Is_On
//
//  Примечания:
//      1. Если в определении вывода порта указано, что используется внешний подтягивающий
//         резистор (PullUp = On), то макрокоманды Pin_In и Pin_Out выполняют действия,
//         аналогичные макрокоманде Pin_PullUp_IO.
//      2. В скобках указаны макрокоманды, выполняющие аналогичные действия, но параметры для
//         них передаются не через определение define, а также как в функцию.
//      3. В определении define последние два параметра можно не указывать, но ЗАПЯТЫЕ ОПУСКАТЬ НЕЛЬЗЯ.
//
//  Примеры:
//      #define Example1    B, 5, Low,
//      #define Example2    B, 5,,
//      #define Example3    B, 5, Low, On
//      #define Example4    B, 5,, Off
//
//      Pin_Out(Example1);	- установка вывода 5 порта В на выход;
//      Pin_On(Example1);		- установка указанного активного уровня (Low) на выводе 5 порта B.
//
//  Пример к примечанию 2:
//      Макрокоманда Set_Pin_On(B, 5, Low, On) выполнит аналогичные действия, что и команда Pin_On(Example3)
//
////////////////////////////////////////////////////////////////////////////////////////////////////

// Основные операции с портами

// Установка вывода порта в третье состояние (Hi-Z)

// Установка вывода порта для работы с внешним подтягивающим резистором

// Установка вывода порта как вход

// Установка вывода порта как выход

// Установка вывода порта как бит
// Сброс вывода порта как бит

// Установка активного логического уровня на выводе порта

// Установка вывода порта как выход и установка активного логического уровня

// Установка единичного логического уровня на выводе порта

// Установка вывода порта как выход и установка единичного логического уровня на выводе порта

// Установка неактивного логического уровня на выводе порта

// Установка неактивного логического уровня на выводе порта

// Установка нулевого логического уровня на выводе порта

// Установка вывода порта как выход и установка нулевого логического уровня на выводе порта

// Проверка логического уровня на выводе порта

//Проверка состояния порта

// Изменение логического уровня на выводе порта на противоположное

////////////////////////////////////////////////////////////////////////////////////////////////////

//

// Конфигурационные биты и биты блокировки

//
//#define INLINE                              _Pragma("inline=forced")

//

enum
{
	b00000000,		/* 0 */
	b00000001,		/* 1 */
	b00000010,		/* 2 */
	b00000011,		/* 3 */
	b00000100,		/* 4 */
	b00000101,		/* 5 */
	b00000110,		/* 6 */
	b00000111,		/* 7 */
	b00001000,		/* 8 */
	b00001001,		/* 9 */
	b00001010,		/* 10 */
	b00001011,		/* 11 */
	b00001100,		/* 12 */
	b00001101,		/* 13 */
	b00001110,		/* 14 */
	b00001111,		/* 15 */
	b00010000,		/* 16 */
	b00010001,		/* 17 */
	b00010010,		/* 18 */
	b00010011,		/* 19 */
	b00010100,		/* 20 */
	b00010101,		/* 21 */
	b00010110,		/* 22 */
	b00010111,		/* 23 */
	b00011000,		/* 24 */
	b00011001,		/* 25 */
	b00011010,		/* 26 */
	b00011011,		/* 27 */
	b00011100,		/* 28 */
	b00011101,		/* 29 */
	b00011110,		/* 30 */
	b00011111,		/* 31 */
	b00100000,		/* 32 */
	b00100001,		/* 33 */
	b00100010,		/* 34 */
	b00100011,		/* 35 */
	b00100100,		/* 36 */
	b00100101,		/* 37 */
	b00100110,		/* 38 */
	b00100111,		/* 39 */
	b00101000,		/* 40 */
	b00101001,		/* 41 */
	b00101010,		/* 42 */
	b00101011,		/* 43 */
	b00101100,		/* 44 */
	b00101101,		/* 45 */
	b00101110,		/* 46 */
	b00101111,		/* 47 */
	b00110000,		/* 48 */
	b00110001,		/* 49 */
	b00110010,		/* 50 */
	b00110011,		/* 51 */
	b00110100,		/* 52 */
	b00110101,		/* 53 */
	b00110110,		/* 54 */
	b00110111,		/* 55 */
	b00111000,		/* 56 */
	b00111001,		/* 57 */
	b00111010,		/* 58 */
	b00111011,		/* 59 */
	b00111100,		/* 60 */
	b00111101,		/* 61 */
	b00111110,		/* 62 */
	b00111111,		/* 63 */
	b01000000,		/* 64 */
	b01000001,		/* 65 */
	b01000010,		/* 66 */
	b01000011,		/* 67 */
	b01000100,		/* 68 */
	b01000101,		/* 69 */
	b01000110,		/* 70 */
	b01000111,		/* 71 */
	b01001000,		/* 72 */
	b01001001,		/* 73 */
	b01001010,		/* 74 */
	b01001011,		/* 75 */
	b01001100,		/* 76 */
	b01001101,		/* 77 */
	b01001110,		/* 78 */
	b01001111,		/* 79 */
	b01010000,		/* 80 */
	b01010001,		/* 81 */
	b01010010,		/* 82 */
	b01010011,		/* 83 */
	b01010100,		/* 84 */
	b01010101,		/* 85 */
	b01010110,		/* 86 */
	b01010111,		/* 87 */
	b01011000,		/* 88 */
	b01011001,		/* 89 */
	b01011010,		/* 90 */
	b01011011,		/* 91 */
	b01011100,		/* 92 */
	b01011101,		/* 93 */
	b01011110,		/* 94 */
	b01011111,		/* 95 */
	b01100000,		/* 96 */
	b01100001,		/* 97 */
	b01100010,		/* 98 */
	b01100011,		/* 99 */
	b01100100,		/* 100 */
	b01100101,		/* 101 */
	b01100110,		/* 102 */
	b01100111,		/* 103 */
	b01101000,		/* 104 */
	b01101001,		/* 105 */
	b01101010,		/* 106 */
	b01101011,		/* 107 */
	b01101100,		/* 108 */
	b01101101,		/* 109 */
	b01101110,		/* 110 */
	b01101111,		/* 111 */
	b01110000,		/* 112 */
	b01110001,		/* 113 */
	b01110010,		/* 114 */
	b01110011,		/* 115 */
	b01110100,		/* 116 */
	b01110101,		/* 117 */
	b01110110,		/* 118 */
	b01110111,		/* 119 */
	b01111000,		/* 120 */
	b01111001,		/* 121 */
	b01111010,		/* 122 */
	b01111011,		/* 123 */
	b01111100,		/* 124 */
	b01111101,		/* 125 */
	b01111110,		/* 126 */
	b01111111,		/* 127 */
	b10000000,		/* 128 */
	b10000001,		/* 129 */
	b10000010,		/* 130 */
	b10000011,		/* 131 */
	b10000100,		/* 132 */
	b10000101,		/* 133 */
	b10000110,		/* 134 */
	b10000111,		/* 135 */
	b10001000,		/* 136 */
	b10001001,		/* 137 */
	b10001010,		/* 138 */
	b10001011,		/* 139 */
	b10001100,		/* 140 */
	b10001101,		/* 141 */
	b10001110,		/* 142 */
	b10001111,		/* 143 */
	b10010000,		/* 144 */
	b10010001,		/* 145 */
	b10010010,		/* 146 */
	b10010011,		/* 147 */
	b10010100,		/* 148 */
	b10010101,		/* 149 */
	b10010110,		/* 150 */
	b10010111,		/* 151 */
	b10011000,		/* 152 */
	b10011001,		/* 153 */
	b10011010,		/* 154 */
	b10011011,		/* 155 */
	b10011100,		/* 156 */
	b10011101,		/* 157 */
	b10011110,		/* 158 */
	b10011111,		/* 159 */
	b10100000,		/* 160 */
	b10100001,		/* 161 */
	b10100010,		/* 162 */
	b10100011,		/* 163 */
	b10100100,		/* 164 */
	b10100101,		/* 165 */
	b10100110,		/* 166 */
	b10100111,		/* 167 */
	b10101000,		/* 168 */
	b10101001,		/* 169 */
	b10101010,		/* 170 */
	b10101011,		/* 171 */
	b10101100,		/* 172 */
	b10101101,		/* 173 */
	b10101110,		/* 174 */
	b10101111,		/* 175 */
	b10110000,		/* 176 */
	b10110001,		/* 177 */
	b10110010,		/* 178 */
	b10110011,		/* 179 */
	b10110100,		/* 180 */
	b10110101,		/* 181 */
	b10110110,		/* 182 */
	b10110111,		/* 183 */
	b10111000,		/* 184 */
	b10111001,		/* 185 */
	b10111010,		/* 186 */
	b10111011,		/* 187 */
	b10111100,		/* 188 */
	b10111101,		/* 189 */
	b10111110,		/* 190 */
	b10111111,		/* 191 */
	b11000000,		/* 192 */
	b11000001,		/* 193 */
	b11000010,		/* 194 */
	b11000011,		/* 195 */
	b11000100,		/* 196 */
	b11000101,		/* 197 */
	b11000110,		/* 198 */
	b11000111,		/* 199 */
	b11001000,		/* 200 */
	b11001001,		/* 201 */
	b11001010,		/* 202 */
	b11001011,		/* 203 */
	b11001100,		/* 204 */
	b11001101,		/* 205 */
	b11001110,		/* 206 */
	b11001111,		/* 207 */
	b11010000,		/* 208 */
	b11010001,		/* 209 */
	b11010010,		/* 210 */
	b11010011,		/* 211 */
	b11010100,		/* 212 */
	b11010101,		/* 213 */
	b11010110,		/* 214 */
	b11010111,		/* 215 */
	b11011000,		/* 216 */
	b11011001,		/* 217 */
	b11011010,		/* 218 */
	b11011011,		/* 219 */
	b11011100,		/* 220 */
	b11011101,		/* 221 */
	b11011110,		/* 222 */
	b11011111,		/* 223 */
	b11100000,		/* 224 */
	b11100001,		/* 225 */
	b11100010,		/* 226 */
	b11100011,		/* 227 */
	b11100100,		/* 228 */
	b11100101,		/* 229 */
	b11100110,		/* 230 */
	b11100111,		/* 231 */
	b11101000,		/* 232 */
	b11101001,		/* 233 */
	b11101010,		/* 234 */
	b11101011,		/* 235 */
	b11101100,		/* 236 */
	b11101101,		/* 237 */
	b11101110,		/* 238 */
	b11101111,		/* 239 */
	b11110000,		/* 240 */
	b11110001,		/* 241 */
	b11110010,		/* 242 */
	b11110011,		/* 243 */
	b11110100,		/* 244 */
	b11110101,		/* 245 */
	b11110110,		/* 246 */
	b11110111,		/* 247 */
	b11111000,		/* 248 */
	b11111001,		/* 249 */
	b11111010,		/* 250 */
	b11111011,		/* 251 */
	b11111100,		/* 252 */
	b11111101,		/* 253 */
	b11111110,		/* 254 */
	b11111111		/* 255 */
};

                                    



//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------

//System Timer Config

//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
extern void InitAll(void);
//------------------------------------------------------------------------------


inline void InitAll(void)
{
  { (DDRC &= ~(1 << (0))); (PORTC |= (1 << (0))); };
  { (DDRC &= ~(1 << (1))); (PORTC |= (1 << (1))); };
}



