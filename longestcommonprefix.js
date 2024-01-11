const longestCommonPrefix = function (strs) {
    let string = '';
    if (strs.length > 1) {
      for (let i = 0; i < strs[0].length; i++) {
        let str = strs[0].charAt(i);
        for (let s = 0; s < strs.length - 1; s++) {
          if (!(strs[s + 1].charAt(i) && strs[s].charAt(i) && strs[s + 1].charAt(i) == strs[s].charAt(i))) {
            str = '';
          }
        }
        if (!str) {
          break;
        }
        string += str;
  
      }
      return string;
    } else {
      return strs[0];
    }
  
  };