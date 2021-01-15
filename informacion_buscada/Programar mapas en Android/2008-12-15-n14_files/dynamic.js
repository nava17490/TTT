function toggleExpandCollapse(B){var A=document.getElementById("expandee"+B);if(A){if(A.style.display=="block"){collapse(B)}else{expand(B)}}}function expand(A){showElm("expandee"+A);hideElm("expander"+A)}function collapse(A){showElm("expander"+A);hideElm("expandee"+A)}function showElm(A){var B=document.getElementById(A);if(B){B.style.display="block"}}function hideElm(A){var B=document.getElementById(A);if(B){B.style.display="none"}}function showMoreTopLinks(){var A=document.getElementById("topLinksMoreSwitch");if(A){A.style.display="none"}A=document.getElementById("topLinksMore");if(A){A.style.visibility="visible"}};

function loadPdf(id, url) {
    var elm = document.getElementById(id);
    if (elm) {
        elm.innerHTML = "<iframe src=\"http://docs.google.com/gview?url=" +
                toAttribute(url) + "&amp;embedded=true\" " +
                "style=\"width: 500px; height: 500px;\" style=\"border: 0\"></iframe>";
    }
}

function toXml(s) {
    if (s || s == 0) {
        s = s.toString();
        s = s.replace(/&/g, '&amp;');
        s = s.replace(/</g, '&lt;');
        s = s.replace(/>/g, '&gt;');
    }
    else {
        s = '';
    }
    return s;
}

function toAttribute(s) {
    if (s) {
        s = s.toString();
        s = toXml(s);
        s = s.replace(/"/g, '&quot;');
    }
    else {
        s = '';
    }
    return s;
}