/***
Copyright (C) 2014-2015 Marvin Beckers
This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License version 3, as published
by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranties of
MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program. If not, see http://www.gnu.org/licenses/.
***/

namespace SwitchboardPlugUserAccounts {
	public class PasswdErrorNotifier : Object {
		private bool error = false;
		private string error_message = "";

		public signal void notified ();

		public PasswdErrorNotifier () { }

		public void set_error (string _error_message) {
			error = true;
			error_message = _error_message;
			notified ();
		}

		public void unset_error () {
			error = false;
			error_message = "";
			notified ();
		}

		public bool is_error () {
			return error;
		}

		public string get_error_message () {
			return error_message;
		}
	}

	private static PasswdErrorNotifier pe_notifier;

	public static PasswdErrorNotifier get_pe_notifier () {
		if (pe_notifier != null)
			return pe_notifier;

		pe_notifier = new PasswdErrorNotifier ();
		return pe_notifier;
	}
}
