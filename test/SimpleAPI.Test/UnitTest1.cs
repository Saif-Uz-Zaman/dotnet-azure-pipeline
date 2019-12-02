using System;
using SimpleAPI.Controllers;
using Xunit;

namespace SimpleAPI.Test {
    public class UnitTest1 {
        ValuesController controller = new ValuesController ();
        [Fact]
        public void GetReturnsMyName () {
            var returnValue = controller.Get (1);
            Assert.Equal ("Something Else", returnValue.Value);
        }

        [Fact]
        public void Test1 () {

        }
    }
}